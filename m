Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07D43D3A113
	for <lists+freedreno@lfdr.de>; Mon, 19 Jan 2026 09:14:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D194010E102;
	Mon, 19 Jan 2026 08:14:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="JmFGeRfy";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JqMOrXmd";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB87B10E102
 for <freedreno@lists.freedesktop.org>; Mon, 19 Jan 2026 08:14:43 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60J84I9T274591
 for <freedreno@lists.freedesktop.org>; Mon, 19 Jan 2026 08:14:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=eb2+7GzkLTGyLPh1TpNzFy
 an03gl3K2xI1Zkdqm28O8=; b=JmFGeRfyPJp2vw1VuT0CGv5WUbo2HOaIDGqA1J
 coIDmtsxxfjsr4/4Z6i1KhQ9QIHgapPOsMyL2FiboxZP/c5iD+qPzn176qkb7h5T
 dwrIxHmLYXRZTXUfAs571DbEbqPoGsV/iGc7V0sLqs29VjjTQc9AfCLAwpFdGZTS
 N5WOV5cDOrsm5VD9+m+mTJZqzaSh3XuLxs3lr2Gg9N2PttEu5bg8Z5IcgCes0mSM
 K5TJ03EIU89W82EJ1sg+qhRnGLfteGDGLqPtnTXERFbW3GFuaV2qlumH+TPQ6ZOV
 NPn+uSpCaBz5350+yCBglQQA5pI27XrinO7T3qLnEnR2Kdag==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4br36dc8vp-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 19 Jan 2026 08:14:43 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8bc4493d315so1167398785a.1
 for <freedreno@lists.freedesktop.org>; Mon, 19 Jan 2026 00:14:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768810482; x=1769415282;
 darn=lists.freedesktop.org; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=eb2+7GzkLTGyLPh1TpNzFyan03gl3K2xI1Zkdqm28O8=;
 b=JqMOrXmdoGb8UmptYOQf2gr51nzvLCdIvBQ/b3y1dGeWnpeyhsh3gM8yvRGk/yrZJ4
 u9q8Ty1CV7h/9zK0opvo/A1EVoLkI572h3Z/tUBOi/nqZVZ9iIBqtad8ZNGEs6mVdYFt
 u9oLVJhHG9ZdKrxobuo+f1Pvyd9v/4vexiTKGjdejJSZr3Iuj89OQ181YwpnfPmMGIC6
 bdoyT7JX6/WPXSipJPlZv2oKyIXOr5MTx2itV0Ra7/1KgzEZlv4U4DHVzY+3sEvt7i+X
 ihgu0/5pZmHkSETC/m5dDqzfVz+ODad16b/1zT1C7IC3k2owWnyGRrEM2K5ZyGEa/yZM
 kfZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768810482; x=1769415282;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eb2+7GzkLTGyLPh1TpNzFyan03gl3K2xI1Zkdqm28O8=;
 b=oRTpF1eKCmZ88aCNPSFI9MP7ritdW+t5jEQbgtu3FDeaQ3zh6qcJTCNGx4iVPVCZvi
 zUIHu0xs757VApir5kNv/OaOyN7rODmrJ8ecgcqG6If126Ma1vrHa1a4JNQYsl2aEEj/
 9hV6JSZbjXgDFJ7qly+lXQbESqyOiQWwGsJKUxUAXKZ8DoWznofCj5R7TqEYTLnn83nI
 aGqL/Cl7c0OOWZ7wDyb0K27GhMUy6oC2Ey45Lz7ZsLNyKJ1h1mOJV6AC7DSBAKC9li++
 xlH5vtwjadzDbzrStS4Afrad6BFjOTnP8m86q/byQgarRYRmY/rV56h9B89aUbINEvdJ
 WiIg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWvBHRVU9l4L+cWomWqT81GRPqQ95khxo2hcxkMC/zkVz8yLyqWAbYUPVhLTyD20wEkD5y6tMt0XrE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzr9SbFlXWsqP/2pNB5XIv40d3wVsLjmRGpE5duOIQEwd6ELM6E
 Wf7PJC/1sgB+dGQhpzvZly47tbVC2Knh5eJJnZ96FJkPkeATYady0snqAooDkH3qAm8akGU8iUg
 9ykBevzW1/TQOzQwsotiAX5agaKO7A9pTZW4P4WcDdCUO2cmFm9dHhzUIhBJk3icUgqX0ROY=
X-Gm-Gg: AY/fxX6CYifpKXH49Q6FJ2CFeizBZ1Uxg6fClGSCrIyg5yxz8titMiM+EbLfoNZ8O4g
 TfsyFYtmZSYczB+RvxHnaHHlTBAaWOYhI4+qxCsmDrwy/aOSaeanQeTT+GTjK5ztghgqGunqLDd
 kovz/9eC2/OJYVR4KM1LkkEspz28dTL2Ub6JtH8aBr58MZLqMXvh+vhFyxB4Y5Z53ihtEfIF+OQ
 6DmwL6X12CSMqKk6UPb4oYJvbjlRgyOkAkomAarLCMQlgtL50/H3ncL0iSo6/PywGeuUILWkdLL
 fo0q4NL7xtb+FuJJBoK1OPRoF23Ati/FVZ42xsg2B7Qh6AxaDeDNn7j2n+W0Rf5/sSl/mXqjpTR
 Bmjv4yz37bK/wuZKyb30BM0PUY8OBm5XQyFjJs3qvqsBOo71xGkOizZqMVMLatGfhIagmcoQUzh
 PTo3VLkeDpwTB0RrAL/ri0k3w=
X-Received: by 2002:a05:620a:3710:b0:8b2:e827:14bc with SMTP id
 af79cd13be357-8c6a693b1eemr1516949985a.56.1768810482091; 
 Mon, 19 Jan 2026 00:14:42 -0800 (PST)
X-Received: by 2002:a05:620a:3710:b0:8b2:e827:14bc with SMTP id
 af79cd13be357-8c6a693b1eemr1516948185a.56.1768810481614; 
 Mon, 19 Jan 2026 00:14:41 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59baf34d572sm3063845e87.24.2026.01.19.00.14.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jan 2026 00:14:39 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v2 0/4] drm/msm: UBWC-related fixes
Date: Mon, 19 Jan 2026 10:14:36 +0200
Message-Id: <20260119-msm-ubwc-fixes-v2-0-e0c8c630fdd3@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOznbWkC/3WMwQ7CIBBEf6XZs9sABjCe/A/TQ4WtJZGirEVN0
 38Xe/cyyZvJmwWYciCGY7NAphI4pKmC2jXgxn66EgZfGZRQRkhpMXLE+fJyOIQ3Me61GIz1ByO
 8hirdM21Ddc5d5THwM+XP9l/kr/17VSQK9NoZTb3WytlTYm4fc39zKca2BnTrun4BFeZZ7bMAA
 AA=
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
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1007;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=+31ip3b70Ip6IMjL7WaTSjxwnIRHrFJ5Xc/ViD4PBaY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpbefuFARiRXSA7jRTI22VW/r0yJd4mYkIeWCjW
 0L7eq/Z0vOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaW3n7gAKCRCLPIo+Aiko
 1TYJCACVdEQSJx6nAf90StbKUmsO+ckIqADUgRKvUxsPI5r2A+yldvfJ/zGkBU4BfGM5Yk1r/bl
 /aTYT0P45DhwTUe+IOTFBm1SSo09gngly/kwt5z4WRj1hXBygzkqtDFOIqvIMH+NwTUo+Ll6bTR
 27yzxlXCQ7AONPchuC4d/yv0hdHUgu0MYMxpnv4nW9MuNHKe/cyarpBLRIx4Cgxt3h525S75Pee
 oBDyPywuOOA+hX/cTT9dmNvOTPYIB1NhYjK5AcmsivJrGIpzMlQEZ76f7EMojsPmDROC/7jjICu
 KO+F3fJ44FM9lH2Lrsy30Zs5hBQfaFDxGRDCGOeyyU48jG2V
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDA2NiBTYWx0ZWRfX7bdHoLji9Svz
 FmNEiylMMa3CtB/TrkgaxRi7ARvp0OwFycPRiSkjMB8C6jGdzpzXnWHiKFCdw3rteqd8JT5U3YK
 bXbJxYCRzcI59w+0tyqPO6pSd2ADYgQAviFelZPykH843FfFIKP/DgOturmibfL+yr8u2b1Lc5e
 xxBMn58c2AFtDpg72zJ4mAqX5omKnVFz62sCsIzVmWmzx5wjDqycs9azjkuEs/SMm0/WygtS6bO
 S8ad6PxddEOsBrLoI/Bh3qdSrOM7aHPrwTp5L4Dz3nTkG45u0KWvVaktWo167EiLAzIcmnthPjm
 egVPwLoX7MResagY0UQoPQjvgPelw/S307mYS70NUTgUgLdyEdYH/ZJOFhANSfpckyOhiyYaBEh
 wZpNPUTDF45hZs5PL8FoVRE264BojJAfNLVMRAymqLgWieyaKsv1+zjChjBMHZtefrCtLthcIw5
 8Y1URCcmVnpnBnrsx4Q==
X-Proofpoint-GUID: 8AFDJKfMTp0IUZW4Vl5bUqV-I7u0kIBN
X-Authority-Analysis: v=2.4 cv=GJ0F0+NK c=1 sm=1 tr=0 ts=696de7f3 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=4HV87y4NaVraivzdFb0A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: 8AFDJKfMTp0IUZW4Vl5bUqV-I7u0kIBN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_01,2026-01-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 phishscore=0 bulkscore=0 adultscore=0 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601190066
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
Changes in v2:
- Added warning if dpu_hw_sspp doesn't support UBWC version (Rob)
- Link to v1: https://lore.kernel.org/r/20260117-msm-ubwc-fixes-v1-0-d5c65ea552c7@oss.qualcomm.com

---
Dmitry Baryshkov (4):
      drm/msm/mdss: correct HBB programmed on UBWC 5.x and 6.x devices
      drm/msm/dpu: offset HBB values written to DPU by -13
      drm/msm/dpu: program correct register for UBWC config on DPU 8.x+
      drm/msm/dpu: fix SSPP_UBWC_STATIC_CTRL programming on UBWC 5.x+

 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 58 +++++++++++++++++------------
 drivers/gpu/drm/msm/msm_mdss.c              |  2 +-
 2 files changed, 36 insertions(+), 24 deletions(-)
---
base-commit: b775e489bec70895b7ef6b66927886bbac79598f
change-id: 20260117-msm-ubwc-fixes-350f67d860d5

Best regards,
-- 
With best wishes
Dmitry

