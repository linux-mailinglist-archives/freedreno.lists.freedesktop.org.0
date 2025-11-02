Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 213A7C2925F
	for <lists+freedreno@lfdr.de>; Sun, 02 Nov 2025 17:39:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E965510E1D2;
	Sun,  2 Nov 2025 16:39:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="MofBD+Fv";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hRSNp+A4";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E07810E1D6
 for <freedreno@lists.freedesktop.org>; Sun,  2 Nov 2025 16:39:30 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5A2AsCKD4162003
 for <freedreno@lists.freedesktop.org>; Sun, 2 Nov 2025 16:39:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=Vsudp5PRE81p+UL97II9GrFo
 Q82PxOzVdfpShaNANXY=; b=MofBD+FvgCKPFuq3/UZeyNcPO7m4lbnHivOxOn7h
 /9eQpsVBicILU9Wyi7oVMysvN7k7Mw9FwfT4cK38MU7Xn9j/1v/0p6/Jf6+/PVhO
 gWjMNLjyOeisd7CIbEtHAh3y7coy+AFabvbvPQNy5jnA6RaGEUMgR++iZmAmLSpe
 FcF9U8T7xzAOGwsxol6eOhhJkNqSmZlDbcZrzrZiAZn9Ez/KyqbMLuBybNFobZGt
 AKrAXmbeaQ/JJrjNAqJO71reaAmJEanyzsfP6lFJkKGi84AHIyY/ZHYgjIvjNIlD
 VzG8fDkGWx/j74iJT8C/kUi3FZfSjsTjW7BgeK1e/d4lMA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a5ayfa9yj-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sun, 02 Nov 2025 16:39:29 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4ecf8faf8bdso80528661cf.1
 for <freedreno@lists.freedesktop.org>; Sun, 02 Nov 2025 08:39:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1762101569; x=1762706369;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Vsudp5PRE81p+UL97II9GrFoQ82PxOzVdfpShaNANXY=;
 b=hRSNp+A4rURFK3/QMyUxwEiEjZb04aqoiYUoIhcFDOpeBBIUtDCbEKFKNupBl+WDhe
 ZfUPTWiaDrTjBsZOWSBreKinLG2ysI/X270daDOoR1VyGm5dvTuy3jQhyf9kcxD83p8c
 8zA/anwFgRb88goQuH7KMuJEYw6zqSIfwrjzpoZAWXrdeLTMQM7e7InUOltntsx+s3vV
 nD/BxqXRUBOa4RU9IKUg8q4fA50OKD4Pd6akNYEeSC1vRnwD8lYaTJsUh0bUsJPAYA2o
 weUXYvWUfPod0zUiPoPCWG/N8l4sGFF+Iik3r7ewm+CB5q5iKOmJrrsa25fhTQ8xp3q9
 CQmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762101569; x=1762706369;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Vsudp5PRE81p+UL97II9GrFoQ82PxOzVdfpShaNANXY=;
 b=pCiZGsMcxnLDDbQ444HlG66TtCusq8mpt6v0ZtHCr5rY8DihxC4jyEvuLRF5MNEMCX
 BXm5FTDJVmrDLGUMhgVacfBRrtViVc8JNQEWF3zzWQP/Zyj8P00YrkLCyvoTaWPznryw
 N3RpAY5mFdEJVRNc6hF8HYwxhuDfOPlJo6wVGoFph42Z9XkX4Jv2Lwm5pzbiCnlxsKGy
 +ZTTUGb2mNlj552IDnEGSUtW2roBDBkq3aQb8KI4p2ScAzgdhjQUH/bTl1qs9YEoeoVQ
 HFSt9Pk9cjyZjhlxnRHppMg+7ilxBi8ZppvkveaBaULHEj/DEfU9yd7Toa82QmZJZSru
 WaYw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXJspW7MYGv7M9YCE7GDvMfjhCuzwkvQdHLHoE0DC02GopK6EVkCNjV8+qYuDq0yVM5y40iZf6eNxA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywu3YXxaGvuRnkEvyrW/HKMCkQgC1tscHbrNH1VXo5RojUZU5g+
 RwFv+LM0Y5DNfweeeUfDbXhApiQOWP+FBtcXcKRd71TKESWEJb24L7DK5L7JSEKr/iE0IlHROfC
 znYTW06E05TL23gH0xWR+PLZQG5cRm5e11fJ4dNSw+JJxe9uImF5GvbmNgSLw6DTHeNiNQE4=
X-Gm-Gg: ASbGncvck3dpcB458nJCgRaWF8yHZUMmkU2Jb6RmCBsNmTvCxk/DQKRr6ZIEXb1QGfI
 LW+UovZJABFGJNdizg7sIlbMmIgj2H6oBn8pvGEufsn6EOTwDzivebndhby309zAmQmZ/sNEWRq
 KFtmlrMKxogMR2DWDAsMJtGSuOCWHqlbFMBXCDPjBA8W7Olpt7bvFu+O36F2h08UpJ+nsLJPSrk
 YKeKrEqwlLRYSREVoPnVaIDD4SWgoMReKZ3DYvKPKy7ZNsWHAwgX568U9/ygM9O3lhPxgFJR4xf
 2fz+YmahIkAQWUfW7aM5YflScKjgIdBkjBg7fxhSBE3mgVw0u+fzSUEIzQ2hDRSMbx9aTLgqCGq
 TwLaIY1Add8JagU2oMCE/kEgf11fsh9gNl8vqcNRQf+4mCsSb+lnZgqoTeTPgdbCSsOEt/HjjHB
 KY99mZeuhPKFNp
X-Received: by 2002:a05:622a:834f:b0:4ed:423d:48d4 with SMTP id
 d75a77b69052e-4ed423d4eccmr57411031cf.54.1762101568681; 
 Sun, 02 Nov 2025 08:39:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFBDCWJDKPzqxu7f2En5m/zHiJp5IOVrgHqGPH6qz1rOivQAZXaoWbSK0Fgiw9Mg8qUeB+6cA==
X-Received: by 2002:a05:622a:834f:b0:4ed:423d:48d4 with SMTP id
 d75a77b69052e-4ed423d4eccmr57410861cf.54.1762101568242; 
 Sun, 02 Nov 2025 08:39:28 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-594282be8adsm789469e87.51.2025.11.02.08.39.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Nov 2025 08:39:27 -0800 (PST)
Date: Sun, 2 Nov 2025 18:39:25 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: simona@ffwll.ch, airlied@gmail.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, geert@linux-m68k.org,
 tomi.valkeinen@ideasonboard.com, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, imx@lists.linux.dev,
 linux-samsung-soc@vger.kernel.org, nouveau@lists.freedesktop.org,
 virtualization@lists.linux.dev, spice-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-tegra@vger.kernel.org, intel-xe@lists.freedesktop.org,
 xen-devel@lists.xenproject.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: Re: [PATCH v6 13/25] drm/msm: Compute dumb-buffer sizes with
 drm_mode_size_dumb()
Message-ID: <vptw5tquup34e3jen62znnw26qe76f3pys4lpsal5g3czwev6y@2q724ibos7by>
References: <20250821081918.79786-1-tzimmermann@suse.de>
 <20250821081918.79786-14-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250821081918.79786-14-tzimmermann@suse.de>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAyMDE1NCBTYWx0ZWRfX0XHiBt42x5eB
 FzFB9GO9EJCy1JWC/L7Aim04YwPXXhJRerw2Ot811Bhp7JNSRsXs4ndqGk0sMd6oEvkGdaMDAff
 +gPg81ypHOi81/fJKnQ1kfZ+1S1XQ1ZD73QvUYTdoCX7rIB7yfM0btBp8M2kgS9lJQ+8egiswjz
 4rw8KSkXNlWfUurlrsh+yaCQD/XW7xY1HCOdnJVP17uIla58q9aetTBBYL1jeuke9X9DXg7PpPX
 pvu8k2vZcVSJzG7mGzcZNMLUIOe8Ovp2WMQsS6Jf7iyQefLImFsoV+mpaJ/7xBodIfFfvmbzfeN
 X90C7g5dREYtDTTELUHLkEmDTEYJf2XEa1Sdki9VpbeL6OlwVpbOsKEUIj9TdGSQz6JjqvFZPk0
 6jYTI+GIzxdn2D0f3RxHVFg6ZTVDug==
X-Authority-Analysis: v=2.4 cv=Scj6t/Ru c=1 sm=1 tr=0 ts=69078941 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=pGLkceISAAAA:8 a=COk6AnOGAAAA:8 a=tVI0ZWmoAAAA:8
 a=4vBwfh3hQKJL6CJddaEA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22 a=-BPWgnxRz2uhmvdm1NTO:22
X-Proofpoint-GUID: QIjE6sTrBIr0J8uFpZoamkkl57lyOvhJ
X-Proofpoint-ORIG-GUID: QIjE6sTrBIr0J8uFpZoamkkl57lyOvhJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-02_02,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511020154
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

On Thu, Aug 21, 2025 at 10:17:20AM +0200, Thomas Zimmermann wrote:
> Call drm_mode_size_dumb() to compute dumb-buffer scanline pitch
> and buffer size. Alignment is specified in bytes, but the hardware
> requires the scanline pitch to be a multiple of 32 pixels. Therefore
> compute the byte size of 32 pixels in the given color mode and align
> the pitch accordingly. This replaces the existing code in the driver's
> align_pitch() helper.
> 
> v3:
> - clarify pitch alignment in commit message (Dmitry)
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: Sean Paul <sean@poorly.run>
> Cc: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>  drivers/gpu/drm/msm/msm_gem.c | 27 +++++++++++++++++++++++++--
>  1 file changed, 25 insertions(+), 2 deletions(-)
> 

This broke kms_getfb@getfb-reject-nv12 and kms_getfb@getfb2-accept-nv12
IGT tests. I'll submit a fix separately.

-- 
With best wishes
Dmitry
