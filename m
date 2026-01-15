Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C93CD284AA
	for <lists+freedreno@lfdr.de>; Thu, 15 Jan 2026 21:05:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE70D10E7BE;
	Thu, 15 Jan 2026 20:05:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="R4cd6SXh";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kuXESAjH";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2A4E10E260
 for <freedreno@lists.freedesktop.org>; Thu, 15 Jan 2026 20:05:42 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60FFY3FK2817191
 for <freedreno@lists.freedesktop.org>; Thu, 15 Jan 2026 20:05:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=VOo2kj0sUGTYxzsW7Js58/
 HUzE5NNXh0gdcCpj1KifQ=; b=R4cd6SXhme8/6/IqtmWQRxioQSmRVB5w85Zq1g
 0D3vvZptotHWWg8xrgLiK9noBVhkW1MoaBq/CKj0n0ZAUIPWycoRHr1i+BZGXH7M
 R9vWDvlCogF5uD70Zi3hEi2KwE7owC/k2QQXcNckmDRL+zxbCPQi37bvOaL7ait2
 doo5j29xJjU3DwISyzo5OPVMSc7g2MRHknYtvRnttSZ5Hn3k3CRPfIfSIf67/80R
 0DIco/SSfX1128xmmG2Rv3RwkrOz6o74FjhjpZ+JAUmTDk1s/pGQFEFpNgGQKw/U
 MplHiwyGqwCtc0KBVf/Gb/b5Z3MFH1tmFN9UkCplA5clBgUw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bpwpxhw0k-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 15 Jan 2026 20:05:42 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8c6a341ac9fso146069685a.3
 for <freedreno@lists.freedesktop.org>; Thu, 15 Jan 2026 12:05:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768507541; x=1769112341;
 darn=lists.freedesktop.org; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=VOo2kj0sUGTYxzsW7Js58/HUzE5NNXh0gdcCpj1KifQ=;
 b=kuXESAjHmIVaL02wgSA4kh3dlQpuP6fb6vUFpGifMeFmtb580hJhOJoOVZoXGKDKhF
 VE55WQynU+EPmlrU5UX6aGskuJxBef+LHcwTzSX+GAknFeNFCWZwPwWqtuU0ovlnd9Br
 r2p9Y5DJgj3lFxKOHtedNLReWF8ud24a2UajdmWIA32HnB2zF9NR1LhvUdFuVyr0Ol2g
 lSlQ90ji48zO4tEwpjtAaDaN4g08AFFUhCjwhjJ8prWwlJFtiNZHre+tfLe1UgNwMrZF
 u5Am/CEfzM8czIcp5WizIC8vPn9uBnPkbbQxXJs63ApmIZYY2T4g+JQy12HMIgOMsWW/
 vVgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768507541; x=1769112341;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VOo2kj0sUGTYxzsW7Js58/HUzE5NNXh0gdcCpj1KifQ=;
 b=GPJVHlFM/W+JoJHIZwdVCBol1A2ntA2GDmMvTemA4vpOmDPi7rGEGfqaywsyRQnAqk
 TW7c+BuPT7xkr6ArT6eJ1wo/qlvoGtQpIg+uvTQNTRn6G4kBJVyUc2cSKJ00Mtf7jsSW
 DaG3MswCS6pjQeWiye0t85iNg0VAqyTX7Pm75v6uERBEvhwVnjmB7vY1fxU5z/R+xZD4
 7nh3XTxaG5LvRKuNGRufmwMqtGHaeIbX3xVpVcITZVydR3woh0Lwpxm6LOu5NZCwYHlA
 xdQhqlldqeMyVPAVC6Gy4OqFKcp7GutAW6XyTLBA6QuZ19y9hKe32JYtGL8TcAqlMPzi
 DqYQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUTn++/ll4Yw/jn3WeQtKI0beS7jSYBQk5jCzOTC+Gt/QY/yyo9LR6baZOXMqrRtPq/lhnptrBspWA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzSbXrI0PwJEocOxVw8goyvQKuNfEWm6JonxknJyrBpB42qU4v2
 ocdJHfFDLjTyWy3h4V3oVVM8iXiBDeIOFvJyA7+0gFvYRq3evYx2ktvoebPua0TY95+sO/iBhCa
 QwEN2bNeZq1SoGzHmf+enMK60z+Uci4ZzHIG+rnhwjx2A72B0DFcSZQ1Q3bQHkdR/D0oPaM4=
X-Gm-Gg: AY/fxX4gevWgYAD6Ybu/vDw2DqZH3rChJ4TEnGHTKSZj8N7Kh64zGQ3B5HzKXXFw9EQ
 pvEi9q1Iw0bMp/B2aMH8e5kJ5+McS8W2dDLNHr9Hk9kSr5SYCHXKqvPIAhL65jS6RIYb/aolu/o
 7bIHLhob7mgHzDIN6ZoiP94niwmCCtLqa2Jyv5hCqrFGMbYo1fuArX8p3Kj0ZWTedNabPHHBO+S
 ZfynJbX5twicmwh0NprGQvGiDE1v3Rc+1bP1f6TOMxonegDlJhSLiPPpTQ1CFj3Mm41EQnmcIaQ
 sWhszW5HTPOF+kbVXhbiDFB+TrC7bEyCe1G4Al48yGsRaW3u89i6XsGv1Fv32zLhIsgwphWnlBQ
 O5L5/w4m/MiirvKfey765jD84ovxoVK4p806vHEmsAk7B0B7IVRNA1Eo0ez/JlF2aXgusntoEIN
 fZOcaveW2lOF65shsrKxGIIOg=
X-Received: by 2002:a05:620a:298c:b0:8c5:2e83:d023 with SMTP id
 af79cd13be357-8c6a67892b6mr103954185a.64.1768507541178; 
 Thu, 15 Jan 2026 12:05:41 -0800 (PST)
X-Received: by 2002:a05:620a:298c:b0:8c5:2e83:d023 with SMTP id
 af79cd13be357-8c6a67892b6mr103949485a.64.1768507540741; 
 Thu, 15 Jan 2026 12:05:40 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-38384e790casm1381901fa.29.2026.01.15.12.05.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jan 2026 12:05:38 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH 0/2] drm/msm/dpu: improve LM allocation
Date: Thu, 15 Jan 2026 22:05:37 +0200
Message-Id: <20260115-dpu-fix-dspp-v1-0-b73152c147b3@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJFIaWkC/x2MQQqAIBAAvyJ7bkEzJfpKdIjcai8mShGIf2/pO
 AwzFQplpgKTqpDp4cJXFDCdgu1c40HIQRh63XttjMOQbtz5xVBSwlHbQOTtYJwFSVImcf9uXlr
 7AOq5x/leAAAA
X-Change-ID: 20260115-dpu-fix-dspp-803dee634153
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=860;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=v6eBzWIh2k7z8M+Jh09NruPQYjfkP6zXlTtfLnImWNI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpaUiSxdpmEuL7vk9ftNWrYgnAQi6PH83uYG5uO
 M+rMT5+rs6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaWlIkgAKCRCLPIo+Aiko
 1eWqB/9FGJka78j5L5ntA9BCT/y6KBF5Wtu+YNWQr41iuEwpC2Ogw7wfnAv6iCMOVREHsuhhfUT
 j+AeoH9A8UZ7I7vFfNi3KSOvRgjwsUs7pLymjEWZWCanMNd1lADQhXKqIPdkQBvEPtTRxykseij
 81fPcuAcc4QLAH++4ms4ENFoe8OK9N7Z5+uGkXsbUwrnProD/LUb9OuHomcSfeFZavghFb5tTb+
 oZPi0Rjv49pDZbu6KdnYR+eYLUWxSNZi9gMtxCx/I6GygPDeHBqTeX2ZRCdA+hjzh4DqXA2ckU4
 O5SPs5ypqb8Ly+tBRbP1KlUNyUPJ46c97M+P7AsS9WUQRaMP
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=ZtPg6t7G c=1 sm=1 tr=0 ts=69694896 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=lK3UKzNOmJigaMNrkuQA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: Q_fBSSIY69-SgAfg4PFvAe29b3wr9tQB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDE1NyBTYWx0ZWRfX5wYHHL1IzXFV
 7840o+K5lZp9L+lYE8A227fEDKbi+NIzePYeZBJdFfyfdqot/fN25+1JdPoHnq2Yb4df/cb/h6A
 ORSOZjpKhnQ4YnR2UZJB/kX9UdS6njzCVXsTz5hqNScQR2CQu3Qy+W2XkRuqUDPPldDbjuzz8Og
 BvE9sRkzHSevtHsxfPDqb/fN0NkrITR8h7DdR+CiHhbDCj3LKJj95bcRIX94Pg32Tissrc2NZH2
 y7Vh0XZbcJyqvtbc6k7C0D7CyFdjGfeC8zaRwYzUzZmkIhfe0S4hk8NwUT0Uj1FVdrGBsphqA1y
 7PJ2scN450+X6MssTTfntlSXAs3j/U1OWXvDx2CplafgNf4NtzMimXvf3a58UuhUKIsSL4LhO2O
 FtVdf5n3duYLDotYIKMOZoihL45ZPY6qiCRKHeSZnuNppmQlem9jVXgjP1zw9X1B4QV6hj33H/v
 pRkkK9ND7yw7RAWuWuw==
X-Proofpoint-ORIG-GUID: Q_fBSSIY69-SgAfg4PFvAe29b3wr9tQB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_06,2026-01-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601150157
X-BeenThere: freedreno@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Freedreno graphics driver community testing & development
 <freedreno.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/freedreno>,
 <mailto:freedreno-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/freedreno>
List-Post: <mailto:freedreno@lists.freedesktop.org>
List-Help: <mailto:freedreno-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/freedreno>,
 <mailto:freedreno-request@lists.freedesktop.org?subject=subscribe>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Not all Line Mixers have corresponding DSPP blocks, which are necessary
for CTM or Gamma Correction. Currently it is possible for CTM-less CRTCs
to get a grip of DSPP-enabled LMs, making it impossible to use CTM (or
GC, once enabled) for other CRTCs. Make sure that RM allocates simpler
LMs first, leaving LMs with attached DSPP for the CRTCs which need them.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Dmitry Baryshkov (2):
      drm/msm/dpu: correct error messages in RM
      drm/msm/dpu: try reserving the DSPP-less LM first

 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 72 ++++++++++++++++++++++------------
 1 file changed, 47 insertions(+), 25 deletions(-)
---
base-commit: b775e489bec70895b7ef6b66927886bbac79598f
change-id: 20260115-dpu-fix-dspp-803dee634153

Best regards,
-- 
With best wishes
Dmitry

