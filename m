Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 972F7AA8A18
	for <lists+freedreno@lfdr.de>; Mon,  5 May 2025 02:15:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2C8D10E14C;
	Mon,  5 May 2025 00:15:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="iqQr7IVh";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBE8510E14E
 for <freedreno@lists.freedesktop.org>; Mon,  5 May 2025 00:15:01 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 544LwJLh014092
 for <freedreno@lists.freedesktop.org>; Mon, 5 May 2025 00:15:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 70R5N83II2gknlMbdIhEMERE7CMg2dERyKgyccEkyWU=; b=iqQr7IVhBWyGuD89
 Kc7IIiWFNIJyjp2lJ2lUfGhfrSq0c7ps7d15ZlvSUuLYl0KDAaxfNKyp1ZsEEoLJ
 hPqkAMmlKiUtEtDsRKDs6PMNix3VrTYBULTpdSx2vaY6PXhD5566ZJShGyhyhRq0
 vc6PnKQFyG/vlgVpKsnl+FrQkdY7F9Bwm6lR0/SAVlUY7sCPcHugCp71Jn4EF0Q0
 KORFcHAemuzQRNoJ3ps6oeG4cxWJEGbRU8OsGR5VyI035vkF7MJB+H4EDJHyeNsM
 W0VC5PACaPQEhZ8bdB39mHsD3rGS/3DeKRXt/CNbt2E3+AWGaXaY6WseR0UZ8Y+N
 Uip2RQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46d9nktqq8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 05 May 2025 00:15:01 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7c54e9f6e00so869617485a.0
 for <freedreno@lists.freedesktop.org>; Sun, 04 May 2025 17:15:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746404100; x=1747008900;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=70R5N83II2gknlMbdIhEMERE7CMg2dERyKgyccEkyWU=;
 b=pulTiqJT8hGKDwmcAWvO3jwTRPBevas0cg/c4XGwtKLNzglkZWSntogLxscI0uw3z6
 9jLk5UQrQhrmQlMaFtq82/R1qUBSz/H9Ab/VF0/s0ctffdB4CwMuYGHZMtr1kBACnY8E
 rWhWAjo2FYqlmb99NgswlkTatlxeC3i5dlviU5fjvT/mrvmtA5TFOm/WoM8qaXoA9zsa
 wkhATGWcXbGD/ficweFupr1RqlhWgPiHN5BIxmA4YPi+EZCIT/fqmItLspzLzX4lMt9B
 0Zh0vcZ4wTU36I6wcQiAk5gp+Rui3kSD/dlRvWncJJ69SSVTju1ja4RJWUXfP+bsoGfU
 JD9w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWMAXOpWpxhPvlSWWrU/hUg++zx/LqXsvv5LatqVfcgHdyhN8mPTvoTcUOM6+gUR6MYaRnIFO1pUWM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwGmU0DfTKVQzvEobxpMXX+3YITZoGQcbgKU+J/Nps6Ou2EYWQw
 swEbJayqeYMm0OHiJ3sIjLs9iT5ZasWToB79yUT/FHhwXviMTUuSgKRZyBilYdOr5xPQUPwbwPS
 r7ZntOABmXSpgMipiYZwxSade/I6eoUV83QCL/tvyCXFz/G6tSzolcTtouVSWFuU9ySU=
X-Gm-Gg: ASbGncu6TkcT/BQYoWqzbXZZ87UM1fmg5HNwmwlqjGaa+/Eeqp0D8HM9yxsrCBH+1I1
 fYPm6xMuNoSkRkFmnLVS3wpYW/bOlr3Or7OA5o52VDJ2P2JczldYNslOFOrOo7Of3YdDEP8AH7i
 Tp+YqSKHdrX304I8JI/Ux/hloulrt+H0uJt1HsS/atsr0kcSPknmj4MkJqcUt23xuj3GMxIIDIf
 Pe/y8z4nfZ9r8i+JdvH/xTh+Vn8Xt7nagWIQjtEpDUpX2EytzSod1WKMXZWVPMDjTlF1AY89udL
 VJqWuYe8dy0NhX5i18BqV4vW913/79zme+rjlofwhWUvZz1QYzS6WsMKfipVvuq2i2moebwekzw
 aTvNfF+JfodCXLzKprsE8Ffzg
X-Received: by 2002:a05:620a:a4a:b0:7ca:d9e8:d737 with SMTP id
 af79cd13be357-7cad9e8d908mr1091030785a.22.1746404099972; 
 Sun, 04 May 2025 17:14:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHRhCRNcvKG5ymjFE6pX4ZnRjXc7dZtbqrZKKdZ0iDjLTptYnzUJfbnAUIC3NcigRTH0B1TZg==
X-Received: by 2002:a05:620a:a4a:b0:7ca:d9e8:d737 with SMTP id
 af79cd13be357-7cad9e8d908mr1091027485a.22.1746404099646; 
 Sun, 04 May 2025 17:14:59 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54ea94ce656sm1454066e87.105.2025.05.04.17.14.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 May 2025 17:14:57 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 05 May 2025 03:14:45 +0300
Subject: [PATCH v5 01/13] dt-bindings: display/msm/hdmi: drop obsolete
 GPIOs from schema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250505-fd-hdmi-hpd-v5-1-48541f76318c@oss.qualcomm.com>
References: <20250505-fd-hdmi-hpd-v5-0-48541f76318c@oss.qualcomm.com>
In-Reply-To: <20250505-fd-hdmi-hpd-v5-0-48541f76318c@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1292;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=gcOjyAZkXuR3SrOQQtUEYQYbb60rDFhov+Xy2NtQ5t4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoGAL7tA9sxa/DweHnrlNpCUZI8ErVU6X39GuyJ
 8xVcAVW1ceJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaBgC+wAKCRCLPIo+Aiko
 1ccPCACgPWq8rM5hryfozxB2ZWetX4xJ24yyrKuD89yYi6VrlRNmyhCy5tuIwVtGlxtPWIPNhQB
 dTWXqSpX1rjDTAELM4B4E59M4ZOn5EMf4QASI7RjO1QxJgvB/oh0RISwTAD41x/DhwsAZW9SYsT
 7HujJL66j41R4uEvXSC//FCkBhJX3lq7m4V2hohlH9NDv7XrBFEGThI0sEM+nzA31Baya9aD1ML
 YEeMypT4BBlpR9/viELikD8eDcvX9mdZ6jxJ4Rq17H/+xAqxGakHWKGUSD1ELIUKf59jy05URF0
 TWRcURDtUuVLJJwIk4b1XLXof83szgUS9+yy+Nf+hHiy1l8o
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA1MDAwMCBTYWx0ZWRfX8gapz1gEkCNl
 K0uJhTM5fDZYsGJJP9LjVzTf1RWMF104EK8elExxkfamO/xbRAQO42vJ/fGrbBBSiskZs4EdmJA
 gQKcFf9QsBJ8Dg8kj7EqnJfPDwmr490oxQc3KYUWOJr+WWEKgCK5tGXcGZHdiXFxtI0F5l5BFha
 83LTNQatnal0LQzRcVqAeOyTmSUg7pa98RweDVsvUieGv6vp8rS/vMB312wMd45Tq+Wu0yNYlXt
 UnhebeIWTQEPnZWapelIGdKFBnQW7ed/Ir7LSke8oLZKL7yPi5eAOAOLNBDmcxBBGp5Yk3FQ98F
 TQ9+rFWVboUDzQT/MvKVUnOzF7sGi8aCN0DqZcxVUEhL6oIeHStFHKAzYf7yArzWHSaemZdP3M2
 Ut910iTmYKecawsSjH8vEsmd8J27kZucvb7ToYBE6IzNcFSyNc/SiVxtrL9I4hWV7TlDEbLC
X-Proofpoint-GUID: S3Q-A4eVgYNkvxdkcY93hPiE7ReJsU_q
X-Authority-Analysis: v=2.4 cv=LpeSymdc c=1 sm=1 tr=0 ts=68180305 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=Q0eG0X4qb_EmYOw2QsEA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: S3Q-A4eVgYNkvxdkcY93hPiE7ReJsU_q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-04_09,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 adultscore=0 lowpriorityscore=0 impostorscore=0 mlxscore=0
 spamscore=0 malwarescore=0 priorityscore=1501 clxscore=1015 phishscore=0
 bulkscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505050000
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

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

The commit 68e674b13b17 ("drm/msm/hdmi: drop unused GPIO support")
dropped support for obsolete qcom,hdmi-tx-mux-* gpios. They were not
used by any of the upstream platforms. Drop them from the bindings too.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/hdmi.yaml | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/hdmi.yaml b/Documentation/devicetree/bindings/display/msm/hdmi.yaml
index d4a2033afea8d4e4f83c9859f8840d30ae9d53f8..7e6f776a047a00851e3e1e27fec3dabeed5242fd 100644
--- a/Documentation/devicetree/bindings/display/msm/hdmi.yaml
+++ b/Documentation/devicetree/bindings/display/msm/hdmi.yaml
@@ -66,21 +66,6 @@ properties:
     maxItems: 1
     description: hpd pin
 
-  qcom,hdmi-tx-mux-en-gpios:
-    maxItems: 1
-    deprecated: true
-    description: HDMI mux enable pin
-
-  qcom,hdmi-tx-mux-sel-gpios:
-    maxItems: 1
-    deprecated: true
-    description: HDMI mux select pin
-
-  qcom,hdmi-tx-mux-lpm-gpios:
-    maxItems: 1
-    deprecated: true
-    description: HDMI mux lpm pin
-
   '#sound-dai-cells':
     const: 1
 

-- 
2.39.5

