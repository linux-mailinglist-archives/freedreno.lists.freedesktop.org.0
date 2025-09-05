Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F68B44C34
	for <lists+freedreno@lfdr.de>; Fri,  5 Sep 2025 05:23:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE34B10EB0C;
	Fri,  5 Sep 2025 03:23:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qs/3W087";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA9C710EB08
 for <freedreno@lists.freedesktop.org>; Fri,  5 Sep 2025 03:23:00 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 584IYF71002728
 for <freedreno@lists.freedesktop.org>; Fri, 5 Sep 2025 03:23:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Nc/Me6JhWACWqZ3Seo6sntz583zORBKIxRCpmiza2Ms=; b=Qs/3W0873vuIK9d0
 LH0HYmRvSGG2ZAEFn8tQJt3jl0Hn0ZahdX/l9RUSs9fwrwcKbVTIFV1Xn+i//T8i
 jywulvtR1dr2Iz4XZjeMGfJ6ujsL1IQJsGqUGjWyDryqaFOqlwu6Ykaof6pJDeQZ
 A9EBOaPuO1yq0RxA4zAV5fv8QWoOW+VRVcydTjQaAZbrpP5tfU9H/H05m53Sjl2m
 nddQaLFx+n1wMnbgyt88sUuX95nE96VZRgM2He/Mg68qb9MjLOxGo3Yx5AycXKpX
 1oxAt4HhPziZ2m5fDm81fc1wY4rk3EdS3nr+7L6yUPak2Q/pk3U7sPPDoX2ksL4x
 2VeHgg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ush39gya-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 05 Sep 2025 03:23:00 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-24c8264a137so22347595ad.3
 for <freedreno@lists.freedesktop.org>; Thu, 04 Sep 2025 20:23:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757042579; x=1757647379;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Nc/Me6JhWACWqZ3Seo6sntz583zORBKIxRCpmiza2Ms=;
 b=IZG4irvSGzRS9+fEnBSa8p7FDbW9qbCq2sKtMhF/DKhr7vBKpOEOAT5tb5+jLBB3xF
 OPDWXEG+Y7zOJuOjHsTfxeKZRJMRfVrXVXwkr1y7wWYsbLFISwkrffAR5usmyvjssMys
 o6flIIBK6JqvqHDelPY429K6uhzZFWrQqyXBRi9N4psRjYwjecfTO5TFBZp3LofT5f/9
 aUqthrKIAg4djmRZBy8QW3eFoy47uSM9P/2qB5KG3j/1rYJCHpUi7WCllmq3p0VIuWFh
 ohuD95rfEi7gUMkTspVKA1Wk+HOw/jBWwqJCwLrIjbo4MPSteM7a7s+HYjYkyVKfh36p
 4ouQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWKK8MOZLsdS+Zz31w5rSXGvCc3Tdnjju6jBKZXcO1zUnBgBjB+3NF5W1EySwEQJg7aYkJV8UhroWs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx18MQUBTL7Ibj85T9HmBd1G0ZWWLsMM8wgkKLKLkSiRfslW3Hk
 lJL9wENuGAU43nhSvbY7uE2gGFGwDAWhojb3lx+R3O2ENQEMD4m6qr8cFnYCejgX6ebt+DKG24M
 i5ZOkNsQoEtz1EAtOTbh4gJ3I6N1o7HT4AMzCFGJkugAQDqBtDmYkjgeLIEthqRze3wn+v+4=
X-Gm-Gg: ASbGncvTnEPU3dz/6Xziqzpr/+8EYOmBWduC5xuY/KdMhKtWM7ZdSOMH9RmbJ01bLBQ
 kgqN17A/4jxdgFtnWqdJMlbCIw5OKcmCjNAD75DuHSgtx+lGP5c3Q/8nE8YuDdJddecwk1FBYRt
 YVrmZme68xmhGIqEuUVEOH9xCEuAfb/xD5vunM2q7KfSDp4CU5LH1daIIfeL4voxZskODQJICQO
 KK0lJGQGU7wrlscKkM9IcY2lwsD3qGaw/GuM+tttB8yzxppWtjtchZ/LfDcOZzaadxyGrg/LWOB
 B9tVL2GJAPXrXYLs+LbG3dVmTvOICz3r/Vq1o3kcY1Db48tOGRnbPQX0O677EmagKVQ=
X-Received: by 2002:a17:903:234a:b0:248:cd0b:3426 with SMTP id
 d9443c01a7336-24944a460c6mr319747405ad.20.1757042579416; 
 Thu, 04 Sep 2025 20:22:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFyydly+6Q3+za/vErI3NFaHpvIdVdkzEH2JljFFmfwcLO7aiqxAf3LzU16QOySCFRu0OmPvg==
X-Received: by 2002:a17:903:234a:b0:248:cd0b:3426 with SMTP id
 d9443c01a7336-24944a460c6mr319746945ad.20.1757042578960; 
 Thu, 04 Sep 2025 20:22:58 -0700 (PDT)
Received: from cse-cd01-lnx.qualcomm.com ([114.94.8.21])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-24c92eb0898sm56355105ad.77.2025.09.04.20.22.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Sep 2025 20:22:58 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v11 5/6] drm/msm: mdss: Add QCS8300 support
Date: Fri,  5 Sep 2025 11:22:48 +0800
Message-Id: <20250904-qcs8300_mdss-v11-5-b6b6a67a1719@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250904-qcs8300_mdss-v11-0-b6b6a67a1719@oss.qualcomm.com>
References: <20250904-qcs8300_mdss-v11-0-b6b6a67a1719@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756974526; l=1044;
 i=yongxing.mou@oss.qualcomm.com; s=20241121; h=from:subject:message-id;
 bh=xP+KCWOk9SNxzFjMtHR6U06UR7/RbmmfOmVurK6QZow=;
 b=Z884TyiVMh6z4n5Eo05hhTpvKy7488klciNK+fDHB2Ltr4fouFJ4gaQDdAtbKOSCIOIfHQHS8
 Mg1w9ymL1zAAM2uX/f3ppo/qQHnXn2O+lwMidxWAVricDecApUAL0aJ
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzMiBTYWx0ZWRfX2rhAJUNfgvYD
 Fuu0Xaj0JgNHhad2/ZFNG+M6ttBmpEcUJQDiAiKwaowRhsyo7+Hd2jTi0hh2iY+By6Jo5uqQA9d
 3AWjVYRDokvvXrzNokkR7ORNAu/PTfhhrTfQ60dnzIPM5eYeHMBnWB1Un/tvt+pGhPSZ6IntKrz
 okoAfOMmdI+9Rn4+wLa15H2VzLPSYfoHZBPrmD6AaqV1ZdbqPN0b7HeaoQRlqEL47I5IKDKsAL2
 9mA2c7TnvSTjUyALGef/fPCeKMWZG9CePiRSUxxylZ2kC+K3YskVJSt+WCk3IVcPqlOCqcR3KfJ
 fuS3LacAq7tOEpV3HcyjkKWM41CxohVHys2/beXUFmwND2sM+2MZBtkIyTscOuP54OFfW+BD4bq
 tGkEHJsu
X-Proofpoint-ORIG-GUID: 0fP-ya1uZU9neCWV5106_GdijfmDxzJC
X-Proofpoint-GUID: 0fP-ya1uZU9neCWV5106_GdijfmDxzJC
X-Authority-Analysis: v=2.4 cv=M9NNKzws c=1 sm=1 tr=0 ts=68ba5794 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=VHyea80QRMuD3TjLfpgA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_01,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 suspectscore=0 phishscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300032
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

Add Mobile Display Subsystem (MDSS) support for the QCS8300 platform.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_mdss.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 2d0e3e784c044db8ac0c478446d211a982cf0350..db2f0064eb72e8a990ff4806f60be74d3ff8dfa9 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -555,6 +555,7 @@ static const struct of_device_id mdss_dt_match[] = {
 	{ .compatible = "qcom,mdss", .data = &data_153k6 },
 	{ .compatible = "qcom,msm8998-mdss", .data = &data_76k8 },
 	{ .compatible = "qcom,qcm2290-mdss", .data = &data_76k8 },
+	{ .compatible = "qcom,qcs8300-mdss", .data = &data_74k },
 	{ .compatible = "qcom,sa8775p-mdss", .data = &data_74k },
 	{ .compatible = "qcom,sar2130p-mdss", .data = &data_74k },
 	{ .compatible = "qcom,sdm670-mdss", .data = &data_76k8 },

-- 
2.34.1

