Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B1AED3A85F
	for <lists+freedreno@lfdr.de>; Mon, 19 Jan 2026 13:17:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CC3610E41A;
	Mon, 19 Jan 2026 12:17:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="NSaTB+Xt";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OSPw2lvL";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBC7010E07A
 for <freedreno@lists.freedesktop.org>; Mon, 19 Jan 2026 12:17:19 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60JAR8C81661133
 for <freedreno@lists.freedesktop.org>; Mon, 19 Jan 2026 12:17:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=VUTjt55ejTVHkuv6u1gjuO
 A/GOQfMpED72ORe2+Ysh4=; b=NSaTB+XtyTQABuQ3S8mkVtap2cLJzvixjxIPoI
 u7nI3Fv5ICFV79UtJpD3Saq4IflGd7cQYCdaXgG9qM/CR4ux44V1HaOCsqfqy1JZ
 urJyzOtzL816nFenZkqTc3JHwrZ9M+Xcs4kCBo/dRNtFT6X7Y6xbxylXssSJS4nr
 FbIIX75HJURek9XEUskrNvgcmgAKQHCxzz1BwgBZ2uUGtGQrjEzET5YW4w4WqkP4
 ES3NAMhxnpprt3ttzeqMJ4bzrykp1jZSyO4bYb9T//gsJ7saEX3iaJrFPGceTa7i
 wOUAWIp07lC/j02J0mDr9jZ2TYR9lx3NPzTBYliWeLAboJyQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bsjvdra1k-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 19 Jan 2026 12:17:18 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8c6b4058909so420541785a.3
 for <freedreno@lists.freedesktop.org>; Mon, 19 Jan 2026 04:17:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768825038; x=1769429838;
 darn=lists.freedesktop.org; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=VUTjt55ejTVHkuv6u1gjuOA/GOQfMpED72ORe2+Ysh4=;
 b=OSPw2lvLNZUcdVnRDImYiwpt4Z/Zn/DLPDPOooT34hI2VesYe/nEte2+YVS3cK43uD
 CY1nsNjWB4UD1jvW+WNisQbWaqg+VCjZiCnXN1WOUp66eDTKx9LNdcPTmq5gpX4BqOqO
 F07VKbgWZ9X8EDwEw1hC8vb/dxWij8jRhJRmnW5QVvfC4m0pwUHbqhURuwThijiFbKFk
 cwC2VtIkUtgyTjCgg0ygcACNUa7i7sHcwsG4hEOk2MDdO0nepLX5saPlemueiRpesjfq
 S+9hGbM0CAEXuFTij/d075k/8xRCFIOREjJsGkFPjBP14LiZm08DbsO7FqiB01HSLyJ/
 pJBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768825038; x=1769429838;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VUTjt55ejTVHkuv6u1gjuOA/GOQfMpED72ORe2+Ysh4=;
 b=jV55z8XFHqL1CnFcnTq6RvwJgrYeRNnidUt0oVb8RQNJsbqZDZreYRi3AMVaPy/hlM
 6j8+suGOyZYWPkS152t07Jc6lpiS7gm7KE8oCbbED3bKh5W+BUv0b6VPINOmpnKmP52F
 8IVQGWTvSbhhQqnouzLiojQ9DDEXMLMkGA1nmMAeoqCl5THRijhQfbuUsMUKXNdkkXjb
 hZ9Q8WziuD+Zz9tQeukRlUU/xV8cXwUURUShw59SOrsYIpv/vFSAyuI338tsCGK3FzR9
 I/pKHnDwUSh/fHNS40c+9yuSlqIteDxyj0CwAwUo3ASr5CUYzpekDanxW6DxcpL9CGDg
 nArg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXPtE3zDJO3CqfhE19+8LTpDTK0RT3oMoQKzCIz6wqjN70X9Q29uWhwm5XFmSRPuqsIlkmQQ2Fvo6U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyipiEsrr8n0EtYbm6SBb6dKbxBkaJozJa4zoDGP9kCT2DMT5eq
 RRPVCiTottTbD1G3Z88iIJNY5p+dSctcmcu2fnZdw3Yog7iZsclVruaBiDpLdeZOaBEno1HxSiC
 jIO2JrAenOg5xrbMgPZ8c+JhlYOSY8qjCAOD/C2FMfO5NCD8iwSByRRzAosshzvld1+qdaxaTPz
 RjXpokiA==
X-Gm-Gg: AY/fxX6h2EHTOqSi7PIHIcaoJk213jr7W1FBARvBrL3w6xE8cwbSt6rigZOBUOOU4ni
 ZPlSeMRXbRl8V8sk/sS7iuisWV23xbz9AiJtQpVXB2U/sJlQKzrwv6uqfvwdev32EZ9fKZ5M0D6
 JA/DHvRBE+HC3lB+T7xAULoulNPnoY0Hj1nPJL8upH/eTCsJvjiHWMsSfv5jOjIvEnk+tWaskVD
 /DWcSpymFa48QiSjQoIZ9FaQHrvytf+P/fG4BaL4ARqGoP/0eR6g1UIprcaDq3COY0BYXzmX5YD
 1Hd0gKaqdVbbbI0mbnu1dkJe1NW31eKlFblssjIXJH76YN6dbWfuylc4XqYSBmDAZ3P8WICtxyf
 ZphiiKhFpdxir3DPbmJw/BiazDsOZM09FRolf5IZIgEa7+r41D4wxwhC2h1jfAY7DTOz2Ev1qgE
 owqhsbxH5K5xe8S41bdo/unc4=
X-Received: by 2002:a05:620a:f0f:b0:8c5:32c7:d2ec with SMTP id
 af79cd13be357-8c6a67ad8afmr1741011385a.85.1768825037701; 
 Mon, 19 Jan 2026 04:17:17 -0800 (PST)
X-Received: by 2002:a05:620a:f0f:b0:8c5:32c7:d2ec with SMTP id
 af79cd13be357-8c6a67ad8afmr1741004085a.85.1768825036803; 
 Mon, 19 Jan 2026 04:17:16 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59baf3a17b9sm3274641e87.92.2026.01.19.04.17.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jan 2026 04:17:16 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v4 0/4] drm/msm: UBWC-related fixes
Date: Mon, 19 Jan 2026 14:16:36 +0200
Message-Id: <20260119-msm-ubwc-fixes-v4-0-0987acc0427f@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKQgbmkC/33MTQ7CIBAF4KsY1tLwU6B15T2MCwRqSWxRsKhpe
 nenXZlo3Uzy5uV9I0ouepfQbjOi6LJPPvQQyu0GmVb3Z4e9hYwYYZJQqnCXOjycHgY3/ukS5oI
 0UtlKEisQjK7RLQVsDkfIrU/3EF+Ln+n8XaUyxQRbYaRwWghm1D6kVNwGfTGh6wo4aBYz+1TqL
 4WB4oipjOSksZavKPy/wkHhpdZaKmYqVv9Qpml6A37gHPk/AQAA
X-Change-ID: 20260117-msm-ubwc-fixes-350f67d860d5
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Konrad Dybcio <konradybcio@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Val Packett <val@packett.cool>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1454;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=odByiESPUGRmFH9tngtI6WdI4/EGTchJdAMNllxoeqk=;
 b=kA0DAAoBizyKPgIpKNUByyZiAGluIMuhRTL5NZArHsjS/MEj8mTu9OBuS6Jq+SpkQemqlynle
 IkBMwQAAQoAHRYhBExwhJVcsmNW8LiVf4s8ij4CKSjVBQJpbiDLAAoJEIs8ij4CKSjV4VgIAJeI
 6x5H9+8erGfTT30hdUxjxNknaprLYtkPQvUgZzFduROo303EfnL/zJ4nOMBm9tN4MYXxHoH9B12
 VBC2qL+VyzUbHwPkw9nSMUFKjsDW7n9vE7qsKGuwfIrpNRI3ajUSUDnkZ0fxPj8WsQp8LpxHGTt
 YNodaseAWCa3rl9yxWz7faAAOue0wy7TiUS6zAsm4kVgWf+zjjmJRRf5zB64zfu/EiHFABx2Q7/
 UapASlJR5ZoDoBWPnUQVwAmHUrcZsk9M1h+qmtfpYLLOQQcHpEuGOdCO9E3BqfpCuENCUCJAMaY
 v+5cEnA64W0NGzmo9dD9v32HBYyXim+KBdxTd/U=
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: ymQZpKeeLhYjQKYPOZMQCNZk6RnkKcdH
X-Authority-Analysis: v=2.4 cv=U92fzOru c=1 sm=1 tr=0 ts=696e20ce cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Xvqa9-5REf62IQFaZ80A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: ymQZpKeeLhYjQKYPOZMQCNZk6RnkKcdH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDEwMiBTYWx0ZWRfX0SLU7YLsFpaT
 IeTHQXaGE4yAUbATjbiv5zxIcJhqmn1xq3iooQZDfbQ0NeLIVVUvP7kAc78Zf8o5dhvEKu5AlLv
 cdoHoBAI9pJwlAfWzWPKf1cxW/1gDlJVHHH+SFuuxH1oASJxZfQsP/Q1Oyy7MSjWkU7LOqswyef
 ATw2lCGxiGzq3RvO7xTyFeburhbBqca9JyCX+7HucESHSL96c3W8+2211CMiqStQhqvJsfAQVDj
 1ORbsNSe6SgW9EcXcGgAeXQ/fFGxarygBjMxUn6bR3lX8/udTxocLIbF2LVyEshszzsvAi82Jmd
 Sa3Fd1I/Vhlm2xZ1mAI+C3q+TUqdEe/g/GF08bHkNt4Bwg88sW5X13022piqvsLsumtnhWrwAuZ
 55modsbK8iYhkkR+W68L/6WMeaJNvoZgp5BUw4c5wBtAE9me0CWPrEJXLy+vy3D7S0Qitj2w9LN
 xeEXyRy1QSgQI+7WXXA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_02,2026-01-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 spamscore=0 bulkscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601190102
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

Fix several bugs, possibly causing image corruption when using UBWC with
the drm/msm driver.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v4:
- Added comment, mentioning bits related to lossy formats (Konrad)
- Also handle SSPP_UBWC_ERROR_STATUS_REC1 together with SSPP_UBWC_STATIC_CTRL_REC1
- Link to v3: https://lore.kernel.org/r/20260119-msm-ubwc-fixes-v3-0-34aaa672c829@oss.qualcomm.com

Changes in v3:
- Added Fixes tag to the last patch
- Picked up t-b tags
- Link to v2: https://lore.kernel.org/r/20260119-msm-ubwc-fixes-v2-0-e0c8c630fdd3@oss.qualcomm.com

Changes in v2:
- Added warning if dpu_hw_sspp doesn't support UBWC version (Rob)
- Link to v1: https://lore.kernel.org/r/20260117-msm-ubwc-fixes-v1-0-d5c65ea552c7@oss.qualcomm.com

---
Dmitry Baryshkov (4):
      drm/msm/mdss: correct HBB programmed on UBWC 5.x and 6.x devices
      drm/msm/dpu: offset HBB values written to DPU by -13
      drm/msm/dpu: program correct register for UBWC config on DPU 8.x+
      drm/msm/dpu: fix SSPP_UBWC_STATIC_CTRL programming on UBWC 5.x+

 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 66 ++++++++++++++++++-----------
 drivers/gpu/drm/msm/msm_mdss.c              |  2 +-
 2 files changed, 43 insertions(+), 25 deletions(-)
---
base-commit: b775e489bec70895b7ef6b66927886bbac79598f
change-id: 20260117-msm-ubwc-fixes-350f67d860d5

Best regards,
-- 
With best wishes
Dmitry

