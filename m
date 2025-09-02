Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C981B3FAD4
	for <lists+freedreno@lfdr.de>; Tue,  2 Sep 2025 11:41:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F057E10E1C6;
	Tue,  2 Sep 2025 09:41:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xb6ZPcu/";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE0E210E63B
 for <freedreno@lists.freedesktop.org>; Tue,  2 Sep 2025 09:41:21 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5822SKL8030313
 for <freedreno@lists.freedesktop.org>; Tue, 2 Sep 2025 09:41:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=X8F1Aylw8vvRYnvl4Vx+2yEC
 SAL/1P4EKbFDjgjCCS4=; b=Xb6ZPcu/3DtxMHqcWy4rG8k1k3LMUuMBDhpv893t
 Vry64vS3KcRkI5c5P+5EmC9T17IxqW+Qnl8BZz1uO1ZBI3aHVRLlqDZSD/eGAJ3h
 3kaIchCS0up2/Oeb1Xaozv+ve5opMxxeVBonvlKQb8JygRwN1tanbo9DvNPc6lZM
 9gM3T5X0qcotf74lDfUG7/g7eaTnoew6gckPrkAdmwVXWCMYUo9rzXM0D7pAh22Y
 l8r5dylc2QI2IghY4vzmynI8PUA40U5LCy9IbSgEYCtJh4EkmqPXaXK62vddlQPn
 UrNw1H3qPqUGh+OxJVRAtFZ6IEzwuDXYtGE8gezUUw/qAQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48w8wy354c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 02 Sep 2025 09:41:20 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4b29cdc7417so100651991cf.0
 for <freedreno@lists.freedesktop.org>; Tue, 02 Sep 2025 02:41:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756806080; x=1757410880;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=X8F1Aylw8vvRYnvl4Vx+2yECSAL/1P4EKbFDjgjCCS4=;
 b=UsC8fjq4tLCVnoswkJBMDP+z89luHNo7DGKOOgqt/v+2tLgH+6+IFjClg/KYCC21MH
 ux2DqG6WmyOk/SHGJZ5qc0wySlctFByWnJ8tMorLVEBzM95Amm1/avP8EBhQ2PWdsmg/
 Jb5wwc+W2E7rw3rgHxuncLxKdsBrvkYOkfkq/mLV26b4U/oOePy2hf9ocuGuDO2wMsnT
 k5a//EeyiSzEXwVQlndiJXtC5vCPDowLdYNmk8gRl8ZQlYOtaYEzyiz1M13D9H/uuE+g
 4Oz317l7IeNvaohiPdaah0VO3++UMC3cqVo/miTo6AE20UCWYu3l6789M1d3+fYZ9kuG
 /XNg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW6EYfNsVD+XCPyfvkSGVCQxH5tlOa3NIAshxDB+8OaaXZ6TCNLDupqxUlffJCcUOk0HqSjgvncoxo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywa8uNh9EYB9CtDgbjtpNml4wjkHZg+a5RNxlF6GmGmXFqyAGMH
 VCj4yL9gzzv30AxqbbKu7m/nSd3C3FcjpCplLyhIEQglf94o158jb5JknV9TM6bRJIhswd8h63R
 eevbI9HIwVgpbm/hiyGYNMlq5dtR6p1aqm5+/0IhP8FQ5jfG/xz9ZSGDTf0WXV1UjEXGUM8M=
X-Gm-Gg: ASbGnct3QVdvvud1tLmwQYuK2o2jbovET08dwg9QKhGvAwMGO7/D8i1zjcTQ2OZyV7W
 pzLo02EuQkYcBA/en6USxLD65uko1qZABVN0DjrGHWrNwOuMEmBrarLeHSk5sBy6Ww6uTwbnPqa
 IrKIp/H4gDrAbf7BXUWqxXxG7ynWQcxifyo+/0q8lEIaaWZL3UUJugeX7D4Mv8QQzbp2+tgmj6S
 EgZi5a/oHlWXt4kW916IW0ukyEWa2LJCeS9Q2X5bpPK57P/d0Zk7WlOcYk+Zb8uUw/qItjB34H3
 GFhrGqaRXFR37WX3cgwIByYYURUTg9mjoq+5/PGlJU+EcV3rFdk5z3vsSQlncv2NT9F9yBStAJS
 OilAxphxS/ue02k4Xv185GqX33582Qan4PFygSTjAJBlYhVx1Dokz
X-Received: by 2002:a05:622a:1a86:b0:4b0:c1c8:ba6b with SMTP id
 d75a77b69052e-4b31d84640bmr144942211cf.23.1756806079706; 
 Tue, 02 Sep 2025 02:41:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG1kM1KKXIRQLni8+uR7WNKiFx9E+rFnyVU/tfrtMInNL9wYmJHshcvZJNSvNe3Lbzu//4Sng==
X-Received: by 2002:a05:622a:1a86:b0:4b0:c1c8:ba6b with SMTP id
 d75a77b69052e-4b31d84640bmr144941971cf.23.1756806078981; 
 Tue, 02 Sep 2025 02:41:18 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-337f4c904dbsm3631981fa.17.2025.09.02.02.41.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Sep 2025 02:41:18 -0700 (PDT)
Date: Tue, 2 Sep 2025 12:41:16 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH v3 12/38] drm/msm/dp: introduce max_streams for DP
 controller MST support
Message-ID: <lngtq2tw4qajgjk57un5xrveblkmtjkkz3yjgue53vp6wwmqmf@owderf4zerfq>
References: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
 <20250825-msm-dp-mst-v3-12-01faacfcdedd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250825-msm-dp-mst-v3-12-01faacfcdedd@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Ycq95xRf c=1 sm=1 tr=0 ts=68b6bbc0 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=KSwXNKDnAPCPISpuv5EA:9
 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: PXJ-s_M6ax47BHQbymMdTZ_Ul7nD0YSc
X-Proofpoint-ORIG-GUID: PXJ-s_M6ax47BHQbymMdTZ_Ul7nD0YSc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAxMDEwMSBTYWx0ZWRfX7zred0NnW8TS
 vx0/WOtP/SPZxGFzI3J5Ej2xJ4vNVVzqBedK0oqMGZtP6m9KJ9RO7YBoXtrQkPxbX3E7yKthuNW
 3yvOdZWAUVFq2H5XRcqoxMBMicII7t1xcgS/L/hUYMFI3Ycx2FVMSvp+nH0QNQ0AVAj2xi6Btgv
 cEINFmioAbMOeSbO2jy0e22lgHNOECcsSRIfvGsG1zYByabNLU4aO1XcllADFOc2qlUb4YQfSLa
 E5tJmfGQzGEEa34yY1oRJ2a2LsZS+0ZkuOq78AAzla9El+Fh6kkg4c6QtIEorsm4Odly5Db81pQ
 wmQql5dGBkVGehWa2kBYI539NX3x73wkhuhxNSTusJs/jONcUSNzPhvt6Hcsgx9XfcskDzT7y3g
 I0XT1uox
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_03,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 impostorscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509010101
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

On Mon, Aug 25, 2025 at 10:15:58PM +0800, Yongxing Mou wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> Introduce the `mst_streams` field in each DP controller descriptor to
> specify the number of supported MST streams. Most platforms support 2 or
> 4 MST streams, while platforms without MST support default to a single
> stream (`DEFAULT_STREAM_COUNT = 1`).
> 
> This change also accounts for platforms with asymmetric stream support,
> e.g., DP0 supporting 4 streams and DP1 supporting 2.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 21 +++++++++++++++++++++
>  drivers/gpu/drm/msm/dp/dp_display.h |  1 +
>  2 files changed, 22 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 78d932bceb581ee54116926506b1025bd159108f..a8477a0a180137f15cbb1401c3964636aa32626c 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -33,6 +33,7 @@ module_param(psr_enabled, bool, 0);
>  MODULE_PARM_DESC(psr_enabled, "enable PSR for eDP and DP displays");
>  
>  #define HPD_STRING_SIZE 30
> +#define DEFAULT_STREAM_COUNT 1
>  
>  enum {
>  	ISR_DISCONNECTED,
> @@ -52,6 +53,7 @@ struct msm_dp_display_private {
>  	bool core_initialized;
>  	bool phy_initialized;
>  	bool audio_supported;
> +	bool mst_supported;
>  
>  	struct drm_device *drm_dev;
>  
> @@ -84,12 +86,15 @@ struct msm_dp_display_private {
>  
>  	void __iomem *p0_base;
>  	size_t p0_len;
> +
> +	int max_stream;
>  };
>  
>  struct msm_dp_desc {
>  	phys_addr_t io_start;
>  	unsigned int id;
>  	bool wide_bus_supported;
> +	int mst_streams;
>  };
>  
>  static const struct msm_dp_desc msm_dp_desc_sa8775p[] = {
> @@ -1213,6 +1218,15 @@ static int msm_dp_display_get_io(struct msm_dp_display_private *display)
>  	return 0;
>  }
>  
> +int msm_dp_get_mst_max_stream(struct msm_dp *msm_dp_display)
> +{
> +	struct msm_dp_display_private *dp;
> +
> +	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
> +
> +	return dp->max_stream;
> +}
> +
>  static int msm_dp_display_probe(struct platform_device *pdev)
>  {
>  	int rc = 0;
> @@ -1239,6 +1253,13 @@ static int msm_dp_display_probe(struct platform_device *pdev)
>  	dp->msm_dp_display.is_edp =
>  		(dp->msm_dp_display.connector_type == DRM_MODE_CONNECTOR_eDP);
>  	dp->hpd_isr_status = 0;
> +	dp->max_stream = DEFAULT_STREAM_COUNT;
> +	dp->mst_supported = FALSE;
> +
> +	if (desc->mst_streams > DEFAULT_STREAM_COUNT) {
> +		dp->max_stream = desc->mst_streams;

We should keep compatibility with earlier DT files which didn't define
enough stream clocks for DP MST case. Please check how many stream
clocks are actually present in the DT and set max_stream accordingly.

> +		dp->mst_supported = TRUE;
> +	}
>  
>  	rc = msm_dp_display_get_io(dp);
>  	if (rc)
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
> index 37c6e87db90ce951274cdae61f26d76dc9ef3840..7727cf325a89b4892d2370a5616c4fa76fc88485 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.h
> +++ b/drivers/gpu/drm/msm/dp/dp_display.h
> @@ -29,6 +29,7 @@ struct msm_dp {
>  	bool psr_supported;
>  };
>  
> +int msm_dp_get_mst_max_stream(struct msm_dp *msm_dp_display);
>  int msm_dp_display_get_modes(struct msm_dp *msm_dp_display);
>  bool msm_dp_display_check_video_test(struct msm_dp *msm_dp_display);
>  int msm_dp_display_get_test_bpp(struct msm_dp *msm_dp_display);
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
