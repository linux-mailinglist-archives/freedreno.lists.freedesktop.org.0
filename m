Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C15A7C00DF8
	for <lists+freedreno@lfdr.de>; Thu, 23 Oct 2025 13:48:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E5AA10E3D8;
	Thu, 23 Oct 2025 11:48:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="J6p4C73S";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 355EF10E3DC
 for <freedreno@lists.freedesktop.org>; Thu, 23 Oct 2025 11:48:49 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59N7AiFb011700
 for <freedreno@lists.freedesktop.org>; Thu, 23 Oct 2025 11:48:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=8JacSqvTb8Izp/E+9oHQMd6Y
 7RxdSS+i4X6P9XWgoUo=; b=J6p4C73SrKh6N6ouWigYKFKpO8AKvdx39XOUokle
 b4AKubnJm3NGQAIRVA1wDV5zT6LXck6tRUJJdZ5JhbPIy2gLf/lLH2IZkqkhtD12
 X7k7kOUYNys6Z2MFYnuI1eAYZIBeyFSwO37BGdW6fcO/6qj9YCcYZDnNEJE2koI+
 4PHNvwRxnjMKFtHdpkBe/ZKhR2mb4k6sKhAekJEZSH7JTGzq/12KzE8/omOjLfQ6
 bMhknSOhXK6t1gPCIsICY+lBZ8TYZ5mDsDtU5vrD7GYYtxtQ7EProzeagE5OwNuR
 d/g2htTeoPKg258Pqooz/Q05su16xWZYTVoPxI9pGbQAFQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49y524aeqb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 23 Oct 2025 11:48:48 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4e8a3d0fb09so9798261cf.1
 for <freedreno@lists.freedesktop.org>; Thu, 23 Oct 2025 04:48:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761220127; x=1761824927;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8JacSqvTb8Izp/E+9oHQMd6Y7RxdSS+i4X6P9XWgoUo=;
 b=BwM7zK5g8CEZ98NjWvqaCiT2KVgjlzelKfyKk3XOoELayXaRpsB69ji/OdkwXIv903
 kXCZXGnPzcf9O/gsvaTRZPg37SBcfU/1zCaIM/r4n+r5+aO3baxnCTDeeKf5epl8uYCF
 yJ6es8ne+DxFOF5hRkKz730SGgjTY8j4eek9Ed4sizKL7kr0qj0yunfZi9tMp5iF35Gh
 rz9/8A5owzz+2aPFHTRuadK5U1TNrqiZ15gZ7FL1F2xEBb4Rkym9ADND9GQN3UUFiVY1
 wQYpN6tyL8fS8a64JFSUZlKYh/YqbGM8yJdkz4y485Z/1/R76V1aqfbqttOB398EfuFZ
 zrww==
X-Forwarded-Encrypted: i=1;
 AJvYcCWQvNfN4SxVt5UthUpDcz12yzj8q7VElqe3C03/zCKeahKYmv7DKB0J5gF56bFXKd+/Ul/j7g7+NDc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxRTz2LrKjMZuOCjbLqt/+ZN19vVjzlosfdoZ271u/4v5vluK2W
 oZ63oqM8Abrjt1k1fw0cXfagKsPMT7MyJHcPrXAZeWkESbbPe9gJaHxNqZHwOuVU06cz4LTShw3
 ZwgEZ4IOZkY9o+hkieJKs/1xFEHcRITGOOnHyt+c++CnOV/Tio1ZIwzWStVP/oXhM3e4Bo3w=
X-Gm-Gg: ASbGncuwxoIGmCFt+Lb5uYymYCwaCAYaxrmz15adfORcJLojTN/O643zLt+PwgnsFr/
 F4pWxljrZMASfwm6x7CDsxrh4/vOVUkacIbjX2DxA2moKnY+VPDFnEVhWHN7MwygRomizHU3tde
 vZym+RTW7Qs+giQ9JkOQ38SK09/WWJ0uLDvhdIK2lmjqU+axSs4rLPV6XnqUFr9R5DE9wdbhbwt
 mDeNVEjLeeMilv93b5ANaXhknsd9z0qQZUYGqtE1wJbq3HsWGzCvD4MMd0FQ9XbXU7McSEVsU45
 26nStCWx76NvMpA9/yGcoLVD6SHx2Q/qpspeSDM8VuWI5fcWRdp3G0cSSyb1+06ShHCe/UDG+fX
 U0oim6YyNz2IY0hzZW5RH48EQ+r1hC7shS3ukjJ1iI2DnX7SMx36/Igm3Ux5AG/D9cMfQUjiPC8
 NcxTnBmWwnxD6J
X-Received: by 2002:ac8:59d4:0:b0:4e8:91f3:ce80 with SMTP id
 d75a77b69052e-4e89d35c00dmr276317681cf.40.1761220127356; 
 Thu, 23 Oct 2025 04:48:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGslKTOl2FnZpR64N0uFwx++ukkNxW4h01yUb6YToY7alXQDtuES4qDK8dNrLcsuDQNbwzhXQ==
X-Received: by 2002:ac8:59d4:0:b0:4e8:91f3:ce80 with SMTP id
 d75a77b69052e-4e89d35c00dmr276317331cf.40.1761220126814; 
 Thu, 23 Oct 2025 04:48:46 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-592f4d2070csm678165e87.83.2025.10.23.04.48.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Oct 2025 04:48:45 -0700 (PDT)
Date: Thu, 23 Oct 2025 14:48:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
 sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, quic_mkrishn@quicinc.com, jonathan@marek.ca,
 quic_khsieh@quicinc.com, neil.armstrong@linaro.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
 aiqun.yu@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com
Subject: Re: [PATCH 01/12] drm/msm/dsi/phy: Add support for Kaanapali
Message-ID: <omlhiywjr46ik6bj2aiutgcf4aifen4vsvtlut7b44ayu4g4vl@zn4u3zkf6cqx>
References: <20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com>
 <20251023075401.1148-2-yuanjie.yang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251023075401.1148-2-yuanjie.yang@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIyMDE1NSBTYWx0ZWRfX0/gvzYSUgaA+
 ga7zXeIJl5ZfRaGRVq+zFK3UbsEUM5/fZ/UD2rl+bC6auBLk5EZETpXdaHqVdI35IdBo0mwUHrW
 i4BPoHZdyu73EXoRiamCcJf8P+YzCO/eI3TEmeGzqwMx9jZ4TAPgGwlT1ODac0XpaL4uIMPSZ1E
 eXIFb98OEWclsn4RdEMzDdb5eWVK0DO/Wf1erAVZVt71hpMKSD8xTsA+KdUQ06J1yyaa0HSFR4o
 OT31uGNQqFmr7Twt2/TBmdzCsvxSDvE6BsYEouMKnortE+gjLPzmRGRLvVIDEOXwKNjnuR4sQcz
 VUZ1kbKvjMQGmf4/iW/2BIMR/Mnt+0PXM15zMp4JSw4I//FwcT0yYvgQ+evF2Si+HM2Y+P0jbCV
 SmmQhqGFG86GVFy06qR3L+nJe4j5yg==
X-Authority-Analysis: v=2.4 cv=Uotu9uwB c=1 sm=1 tr=0 ts=68fa1620 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=B1tu1MuE3RNTBmX3WhkA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: bf4iotYXuwV8rC_ocv9zEhnSYdGM_98x
X-Proofpoint-ORIG-GUID: bf4iotYXuwV8rC_ocv9zEhnSYdGM_98x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 adultscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510220155
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

On Thu, Oct 23, 2025 at 03:53:50PM +0800, yuanjie yang wrote:
> From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> 
> Add DSI PHY support for the Kaanapali platform.
> 
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.c     |  2 ++
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.h     |  1 +
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 23 +++++++++++++++++++++++
>  3 files changed, 26 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> index 4ea681130dba..7937266de1d2 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> @@ -577,6 +577,8 @@ static const struct of_device_id dsi_phy_dt_match[] = {
>  	  .data = &dsi_phy_4nm_8650_cfgs },
>  	{ .compatible = "qcom,sm8750-dsi-phy-3nm",
>  	  .data = &dsi_phy_3nm_8750_cfgs },
> +	{ .compatible = "qcom,kaanapali-dsi-phy-3nm",
> +	  .data = &dsi_phy_3nm_kaanapali_cfgs },
>  #endif
>  	{}
>  };
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> index e391505fdaf0..8df37ea50f92 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> @@ -64,6 +64,7 @@ extern const struct msm_dsi_phy_cfg dsi_phy_5nm_sar2130p_cfgs;
>  extern const struct msm_dsi_phy_cfg dsi_phy_4nm_8550_cfgs;
>  extern const struct msm_dsi_phy_cfg dsi_phy_4nm_8650_cfgs;
>  extern const struct msm_dsi_phy_cfg dsi_phy_3nm_8750_cfgs;
> +extern const struct msm_dsi_phy_cfg dsi_phy_3nm_kaanapali_cfgs;
>  
>  struct msm_dsi_dphy_timing {
>  	u32 clk_zero;
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> index 32f06edd21a9..93e53fb8b4fa 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> @@ -1518,3 +1518,26 @@ const struct msm_dsi_phy_cfg dsi_phy_3nm_8750_cfgs = {
>  	.num_dsi_phy = 2,
>  	.quirks = DSI_PHY_7NM_QUIRK_V7_0,
>  };
> +
> +const struct msm_dsi_phy_cfg dsi_phy_3nm_kaanapali_cfgs = {
> +	.has_phy_lane = true,
> +	.regulator_data = dsi_phy_7nm_98000uA_regulators,
> +	.num_regulators = ARRAY_SIZE(dsi_phy_7nm_98000uA_regulators),
> +	.ops = {
> +		.enable = dsi_7nm_phy_enable,
> +		.disable = dsi_7nm_phy_disable,
> +		.pll_init = dsi_pll_7nm_init,
> +		.save_pll_state = dsi_7nm_pll_save_state,
> +		.restore_pll_state = dsi_7nm_pll_restore_state,
> +		.set_continuous_clock = dsi_7nm_set_continuous_clock,
> +	},
> +	.min_pll_rate = 600000000UL,
> +#ifdef CONFIG_64BIT
> +	.max_pll_rate = 5000000000UL,
> +#else
> +	.max_pll_rate = ULONG_MAX,
> +#endif
> +	.io_start = { 0x9ac1000, 0xae97000 },

These two addresses are very strange. Would you care to explain? Other
than that there is no difference from SM8750 entry.

> +	.num_dsi_phy = 2,
> +	.quirks = DSI_PHY_7NM_QUIRK_V7_0,
> +};
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
