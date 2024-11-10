Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA369C3404
	for <lists+freedreno@lfdr.de>; Sun, 10 Nov 2024 18:31:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C061C10E3C6;
	Sun, 10 Nov 2024 17:31:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="lJFtCLRM";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 031B510E3C6
 for <freedreno@lists.freedesktop.org>; Sun, 10 Nov 2024 17:31:47 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AAGUasV006330
 for <freedreno@lists.freedesktop.org>; Sun, 10 Nov 2024 17:31:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 NoqymUbSuzTfgs3YfQWe8EZeWIHhOdUDYitzaoggpdU=; b=lJFtCLRMl269Usas
 3Ak6ouXeiC6W3fjbyHgv7FZ0OcFExRF4xKmJkBJoYGdhFOuVGovsvohqYUb/7PY1
 L7nscyrjJaICDQkCbNgB3HrN2uAOaO9F6JbLoHSj4pedpFszvc1eIoCokyAyfpcu
 eJ3Vn+DbOlKDCHwCjLL5dtZMSObUVdKbKV95UaXti/XqiH8mweqOXy0wp9bSRFvh
 mszqbBs4LTwyRRhVDA/Jq7z3/y799czRipsw0pSrnxAfhXuPvL5Cm3PKy4KuWi/F
 YzyjcbvIJn+nv+ocpXd/673oVYDs5GNnnsD+xkzB2ONRyWbcHI+TanKi+b85wrRp
 fys5sg==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42sytsjcxd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sun, 10 Nov 2024 17:31:46 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id
 5614622812f47-3e7a207b659so329064b6e.0
 for <freedreno@lists.freedesktop.org>; Sun, 10 Nov 2024 09:31:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731259890; x=1731864690;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NoqymUbSuzTfgs3YfQWe8EZeWIHhOdUDYitzaoggpdU=;
 b=AARxHXzSt8sxEOPTNGQUafIFlHQITvYweu+7hkDX3KnAAYSxix16Z06bEeHjLAfrCa
 LwIC9YEqvSwmO7PDEO+xO9unfPNIbreSLfG1/uP4s6Vyvw9EvaeaifHetnazmACH9Ls8
 wJpflrshRViWr61S1L7tFK2p+lUr1OXanYYt179I3MU8BKoi7v3jz+QhdEhJq+62WWtl
 WvEk8dzMVA1jJSVWIvZN1Wx96vMvGgKitW5pUtzVLLEHCHzgg775kZNv/hfHbSetr8lt
 JnRO+WCTLUGF/9tLWMc16XODJuRoizTTFUgokFZxPU3Tdzc21SdmaOIz+Pt7i9QirWI8
 IzAQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUfftwRWZ8KEjuB01V5xaQAbN2w0k6dcs7Mk72DEx1cWn5UpxrPfsrz1V3ut+WUeKi0pfA7hDPbrt8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy1nj+vardp62xW0Hv8h0GTuQKK7BYMvGCoHISS26Mn5DeI/wYN
 gQOZZ1kLiqLZz+yMLOa9RPgRcBG2Bl3Ea4XddngsWk4uUXkol1R5AZpCyfu8YqfAUh/qWq8PrwA
 D6TMEBJ9XOKYHPpwmOfCEXKpU9BYBi9Fi2t0p8UNLOZlWAem0S+PjnCSnyE/hyiluBcE=
X-Received: by 2002:a05:6808:2105:b0:3e7:6468:1fd5 with SMTP id
 5614622812f47-3e794657653mr8350235b6e.34.1731259890671; 
 Sun, 10 Nov 2024 09:31:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEWyxhZzgV8jj3hMo4wiNEnob3/wxI89e+SDHXIT7eMFyTQmCzwSrCFBhaciMwwS6unG6wSjg==
X-Received: by 2002:a05:6808:2105:b0:3e7:6468:1fd5 with SMTP id
 5614622812f47-3e794657653mr8350216b6e.34.1731259890376; 
 Sun, 10 Nov 2024 09:31:30 -0800 (PST)
Received: from [192.168.86.60]
 (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id
 5614622812f47-3e78cb53843sm1718506b6e.0.2024.11.10.09.31.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Nov 2024 09:31:29 -0800 (PST)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Sun, 10 Nov 2024 09:33:41 -0800
Subject: [PATCH v2 2/2] drm/msm/adreno: Setup SMMU aparture for per-process
 page table
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241110-adreno-smmu-aparture-v2-2-9b1fb2ee41d4@oss.qualcomm.com>
References: <20241110-adreno-smmu-aparture-v2-0-9b1fb2ee41d4@oss.qualcomm.com>
In-Reply-To: <20241110-adreno-smmu-aparture-v2-0-9b1fb2ee41d4@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1536;
 i=bjorn.andersson@oss.qualcomm.com; h=from:subject:message-id;
 bh=HkkqzqYZ9I8U3OYgFmCXR7x8x0rR8hNjb441DaC0VZw=;
 b=owEBgwJ8/ZANAwAIAQsfOT8Nma3FAcsmYgBnMO552UOCpdvNfPRiy9GOkjK7Xvxw/DaFyCNyp
 jJhQw+LOgaJAkkEAAEIADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCZzDueRUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcUORA/+JTP943OIpYznMXjcUo9YS9qQBZF3wzGvp2JZEcJ
 ClLWvzOfnzv8dYtF726azGr8Ww82GcjAhA7KnjubhyHOGZ2hkWs2dxIs35kdf2z2MCcLJ2nekTt
 eeopFGoypHfhjACVSDFLGUzPApt1Gjpp2YTO9a0o/kYe6L33kC7d6WDcKaTxB8TIWRbhKZCHxKZ
 OoB9b1W1nnfRt7XRnWJIHtctPLqL3sJ7Z+0IS27cudn1UMoxSc5J2Oz5HgOroLDTuZC9UCryrS5
 x2T3xBRvBgpICaqHJ7QeZefLfYSoy/9OGsMYPkUoYrXvMNvtWia3/HtFM3sBq0kweUPuzB3uVLQ
 lgnxZp2rf0n9mBVx1pSykK0cLFqzMcPktXLcMHAUPEX/jh6IizZzhiODgGbV3wNUge5QUkqu5pa
 Tonj1Vfj82AEDvtGkNcCGPH8tlv6SfetBONB0lHY5sWlIjT0z3bj2G9T8CLINtWRuoyRIxWSs5l
 RfvaIi8OOUiKKF4DwW49JCdmqsIuF5ptcPNwyT2qHB19Z8pGrcbwsOzm+9gH7XUCdeKNkw7HgUZ
 KfMmODvxKAsi8LZITL6ov/T6mqdGSurJp1b8VJ3wCHiBIGU6oiq/FBpU47+clyETjoIW/+OYy/x
 etfA38hrTphrg0AIM7PPlBglWVI2EKO/NFMAqHuUamc8=
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5
X-Proofpoint-GUID: uZ6uyc481J-IsFinx4IZWHzw1nlO2Szi
X-Proofpoint-ORIG-GUID: uZ6uyc481J-IsFinx4IZWHzw1nlO2Szi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 priorityscore=1501 suspectscore=0 bulkscore=0 impostorscore=0 phishscore=0
 mlxlogscore=999 lowpriorityscore=0 malwarescore=0 spamscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411100156
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

Support for per-process page tables requires the SMMU aparture to be
setup such that the GPU can make updates with the SMMU. On some targets
this is done statically in firmware, on others it's expected to be
requested in runtime by the driver, through a SCM call.

One place where configuration is expected to be done dynamically is the
QCS6490 rb3gen2.

The downstream driver does this unconditioanlly on any A6xx and newer,
so follow suite and make the call.

Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 076be0473eb5..75f5367e73ca 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -572,8 +572,19 @@ struct drm_gem_object *adreno_fw_create_bo(struct msm_gpu *gpu,
 
 int adreno_hw_init(struct msm_gpu *gpu)
 {
+	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+	int ret;
+
 	VERB("%s", gpu->name);
 
+	if (adreno_gpu->info->family >= ADRENO_6XX_GEN1 &&
+	    qcom_scm_set_gpu_smmu_aperture_is_available()) {
+		/* We currently always use context bank 0, so hard code this */
+		ret = qcom_scm_set_gpu_smmu_aperture(0);
+		if (ret)
+			DRM_DEV_ERROR(gpu->dev->dev, "unable to set SMMU aperture: %d\n", ret);
+	}
+
 	for (int i = 0; i < gpu->nr_rings; i++) {
 		struct msm_ringbuffer *ring = gpu->rb[i];
 

-- 
2.45.2

