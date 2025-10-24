Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45C7DC06D10
	for <lists+freedreno@lfdr.de>; Fri, 24 Oct 2025 16:57:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E35C610E10A;
	Fri, 24 Oct 2025 14:57:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="FfE/7FXN";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C3BA10E10A
 for <freedreno@lists.freedesktop.org>; Fri, 24 Oct 2025 14:57:15 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59OCvjXg022356
 for <freedreno@lists.freedesktop.org>; Fri, 24 Oct 2025 14:57:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=60sB8Wuf9kTa2rtyBom7E3
 5OMwjLtVwCZLKP46MCeGQ=; b=FfE/7FXN/lbKuAWCh0Ln0vnyufCffscLn+hLvp
 imRcO/oQWFF0pLuLN6lZ5+mSzinrRhhVA0HLprolG6iuNQBB77sUPMXqGgDlxqRl
 13TOsqejJqR9Qc2aMWxc+gazN4BVggsrRa/G1i0/DwWsWatpS317LD0S4c4GyGS5
 rPS4qL4ks5/K33jmDimBMON+MGLLtPSEWYZa1I1bFHs8QJCuZh7SMgHv9/gERUhO
 5eYLLP1x0AtsCPPmoMuZmBF9idAyBb5D7YwnFxGwqXGgJD56ZjeXijd5/CwVMOO2
 qKqVYpB9ThiQarTbuzf88XQ1+u/FU+Fb81IuVLO6obhqIVOg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49y67qpbf7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 24 Oct 2025 14:57:14 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-7a27ade1e73so1373238b3a.2
 for <freedreno@lists.freedesktop.org>; Fri, 24 Oct 2025 07:57:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761317834; x=1761922634;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=60sB8Wuf9kTa2rtyBom7E35OMwjLtVwCZLKP46MCeGQ=;
 b=U3R2DeGWoYh9hOT0EFGV1WX+fgmtnhztngiNgOTN9xSC1b7a3btg9fSsFlp8B9/s0a
 tflOMN+4Q21d+6qH1Ew7TjvhA1Nqa3gDLHu0TJaVn9cRtvuEnkYbHVDBMe1z1/61PjI9
 XgTFeiSoziQlK0hLhNuGkeyEWZFgAwy8SsgLQYAXlHKvGyeLMdSrPJLeLxWnCzeKCY6K
 h2TlYasdspR2zKq9XOdBGzpR+/CJ2j82iwdF7P9ayeTe3m+14vmtQrV7z9+FKBSr7ZZX
 aPouuueoiTqrbf6UkdvtgxactD6AhmkB4ijs2eXPAStvGZlR1j5MqrEUHmWiQsXjuD+f
 m+1g==
X-Gm-Message-State: AOJu0Ywmkfh8oK3Xei8yW/BHdK771pGHnT63jJoa2xDnzW+l5UnK0Oxv
 NUfx4p7uAvXzdwxHRrJYCRH/hodNzmnJ3ayDk1aAsyYbymXnn2NCywz8inSg/zrIauKgHXw/Q8Y
 JNjZR9EmgHIfZpSBlLRYWhj8xXowBwYp+jHAKajKx2Jh8PRznxuDk96ELRX6p9lmIXcrnfqNnle
 2WIeQ=
X-Gm-Gg: ASbGncuPaX1+E4Mc466Of/oBaB08CZUSGNGuIrzocgw0AWtNv9RzvjaQSYYDHM6zsC1
 b7DWimNIS6dMlDWMPyjPz0+5y4KiT49AeKuiHxRih+Gv1niOUeDl1vp3qz0A3yptnOF9ACqXn9l
 5irC6vFuzQT7DUif+DxBN3nkt+zaYeQzcUNgytd+OgybI0C6HZcB7DqDZ3H2gCUkIIEVkILVytJ
 bC9OJ4VaeoF21eCWkYT0ynAjC/1u0MXLtr5nnTqtLzm5sq+LVo+lGtYgCW7cbFoFgAVwiL8paUO
 OEF6kaQb+Ay2l6uftF3rpZT9nrDJskjvbDRAU9orrD7ND3vhnJ5KiaAcvOB6DW5bkDcmdRRwEuC
 ixSL6UfSU4kQv8eGcB3iIiOI=
X-Received: by 2002:a05:6a20:6a20:b0:2cd:a43f:78fb with SMTP id
 adf61e73a8af0-33deb36eb42mr3243598637.48.1761317833830; 
 Fri, 24 Oct 2025 07:57:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHoCzabHI6k75TFLxJXPCs3EzFvxfhcUQKHHRumUBapOaZLUKiSau/3jarrJCmQTq99vTz3iQ==
X-Received: by 2002:a05:6a20:6a20:b0:2cd:a43f:78fb with SMTP id
 adf61e73a8af0-33deb36eb42mr3243559637.48.1761317833320; 
 Fri, 24 Oct 2025 07:57:13 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b6cf4e326c9sm5282228a12.34.2025.10.24.07.57.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Oct 2025 07:57:13 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 24 Oct 2025 20:26:41 +0530
Subject: [PATCH] MAINTAINERS: Remove Jessica from drm-msm reviewers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251024-remove-jessica-v1-1-f1bb2dfc2e18@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAKiT+2gC/yXMywqDMBCF4VeRWTeQu9ZXKS5mkrFNQW0TKwXx3
 Rvq8jtw/h0K58QF+maHzFsqaZkr1KWB8MD5ziLFatBSOyW1FZmnZWPx5FJSQKGQovEGrbct1NM
 r85i+/+BtOJ35/and9RyBsLAIyzSltW/8iGQ0kXeyQyLqqCUVnL12bO0og9FGS44OhuP4AexUH
 R2sAAAA
X-Change-ID: 20251024-remove-jessica-1abd363a4647
To: Rob Clark <rob.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Rob Clark <robin.clark@oss.qualcomm.com>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761317830; l=1017;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=1gylyZmwNHyN2C9jDd9SKYKbQ5zm1ooRwXpqxab04r4=;
 b=pdd+LTwZ020zxaFl6Wy5zG3KXzhkz84usSUTeXn1QGl2mVqqs8x4yLz5fcQNOxh5I2lu0NXM9
 o8xsd1jvA5LD7aQyht28013ZYK0iWWNDL+yyHlDXvN92sR6M/wy2b6X
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIyMDE2OCBTYWx0ZWRfX1iDzDnnV52Ka
 N2AqeX0vPGb4C8gNCr/CbHoAMUYCDIZzNVKq/N5z9F1KnM4NlZpWV7HUMLjuGlu/PbKWLjCWgNW
 j95OKSfuI05OO5MiklbQnySRsImZEQTrF90v58jjzbv54y6UsVhBfUqiKtHxAhi3L0a+iwrkMIV
 J3CRBBySwXD6pBEYAJ4/Lp06zQFBNdhr29CPWEU6XhTuHW+IjSkJyYnoCrjHJX4Z2kalpO1AeJc
 n1tXrFEqC/noCmvb4B9XiQyqMtEkdUiqhNd9qcGvSJVeNyO0JAuhY/HXZRjHOujhvkMMwWfxkXT
 Q6FMIj1+CfmAFarc8yT0mGaPP/9hV/d74T9AbAAILm48AAc2NJU9dT4o4W+PDv16exm7odvWhNx
 1DtNppNSc8Uw5SdiY5IejHMPgA2eyg==
X-Authority-Analysis: v=2.4 cv=LMRrgZW9 c=1 sm=1 tr=0 ts=68fb93ca cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=tVI0ZWmoAAAA:8 a=oH-qu8LnP-yuNCiDOAsA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22 a=-BPWgnxRz2uhmvdm1NTO:22
X-Proofpoint-GUID: 3Sbcml7evDxx1gxW840a2o1uOgbn7swP
X-Proofpoint-ORIG-GUID: 3Sbcml7evDxx1gxW840a2o1uOgbn7swP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-24_02,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0
 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510220168
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

Jessica has left Qualcomm and her Qualcomm email address is bouncing.
So remove Jessica from the reviewer list of drm-msm display driver for now.

Cc: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5889df9de210..064aecda38cf 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7889,7 +7889,6 @@ DRM DRIVER for Qualcomm display hardware
 M:	Rob Clark <robin.clark@oss.qualcomm.com>
 M:	Dmitry Baryshkov <lumag@kernel.org>
 R:	Abhinav Kumar <abhinav.kumar@linux.dev>
-R:	Jessica Zhang <jessica.zhang@oss.qualcomm.com>
 R:	Sean Paul <sean@poorly.run>
 R:	Marijn Suijten <marijn.suijten@somainline.org>
 L:	linux-arm-msm@vger.kernel.org

---
base-commit: 6fab32bb6508abbb8b7b1c5498e44f0c32320ed5
change-id: 20251024-remove-jessica-1abd363a4647

Best regards,
-- 
Akhil P Oommen <akhilpo@oss.qualcomm.com>

