Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92C64C00EF1
	for <lists+freedreno@lfdr.de>; Thu, 23 Oct 2025 13:59:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D86310E3D8;
	Thu, 23 Oct 2025 11:59:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="jBArtMrM";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A0CD10E3D8
 for <freedreno@lists.freedesktop.org>; Thu, 23 Oct 2025 11:59:17 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59N6uVPb023961
 for <freedreno@lists.freedesktop.org>; Thu, 23 Oct 2025 11:59:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=6ZSrNBn4GN8xDjxxz5ymQXTF
 nfG4FbPwRaNc+3tmIX4=; b=jBArtMrMMQ3Q9zwl0FdCWDXTmxemZOWH+k4X6upE
 5DsDe8FZq+cVunSxeP79+MTQjhclQ2yqOCSEBg99GgD3GYnJX0xzajphfv1bgoSr
 98RjWm7LbNewP/hxEljbTXKmLf3UfsDd+4E84/QWEGaMaYhiSVeyFhSCJxf/oM/i
 3oolw/EivwVoiWAouOIimYGLuEYhtDFv/+JHB2LlUf+fCWry6OH8nOcWbnFkGUe4
 yl8tuuHgG38xTJ/Q+bJq10xagTk/lW9JSyTyFxNTBhySXQDgtS5UF9h0+J0khXMR
 BJrIcXWNrTI1WMUgmV+HbvlFbH8Ozn3ByOUmgZqfHbI+Yw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v1w889g3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 23 Oct 2025 11:59:16 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4e8a9ec4746so39702621cf.3
 for <freedreno@lists.freedesktop.org>; Thu, 23 Oct 2025 04:59:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761220756; x=1761825556;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6ZSrNBn4GN8xDjxxz5ymQXTFnfG4FbPwRaNc+3tmIX4=;
 b=jTouwoLB9MkLNiRWAws2Ez+7JA9C8fvxUNrNY0XSgU3Qp2RQJ2gCSWwqjeDgqDFkJm
 qQvjlr9u+ZG+uX3KplurQDYoZYwFO7wsLqc0rPh7u9xbhJWIBfk/8Q9OBsWFqMF9nX4K
 1nvAZHPmGIM6pq+DCkpJLDH8+/1jw6twNa2Y2ex10jZh3uIRZkb86Z5nbMYzOYoTVEXA
 DtGotIFOVhVPPWyBsc7DcSmZNL6BtuyB1/Ksi/7u/WFE77hOT/zLviZPs/h9UwoiKCxh
 6zjX9Kw1RCjvRTmEogoyQ5p6o9pktDmcIqI6PgBbK1B0yNROqc1b1ZKPgKiDE46c0M/Y
 IvPA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUaW4LASwnPbIjbgZd9MoW1FMz8xNRuoT7XEBoSu3F4qmWM9jxw0w8shlVDsXl9gLby+Zqqd363G2s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzvwsKZHx3+voKqCN5kriEqhkbhBxzf5dY9p6bLLvTf/Osum4jg
 hJGA9AcdubTwXRIyQWFRmFsvcXmz/q8tFiortLxg+xD+IGuIo40oUYvwWuDbrRXMROcquds9FTS
 mBc06vfiXxoFd2peCSCSAAjxJ7lUFcvNDhzkjx70+CmRn7Z//rwmK23j8vQ4PKOn9hpjANBc=
X-Gm-Gg: ASbGncslM0VpTd6Tl02zkpDyAzA6hfEi8L64XSJP1F/VEvkos00cyvRxR/vjTQHd2F+
 XuLX5ZpzxJ7Y0F0MfSq3vN+6txTKA8HqRoH/+g4hbn2K34uw6mN4fj8bvllcUhSaJJNebT/FLFT
 21sStJlZYTwNFgrKSArL9Hz3EH8tpMB/KqiWkkKMSvmMNOBTYr7py9DQUurhP/N5bGuZvwz+q6N
 ffgbO4urlpJi/bZG0yHoUfH8Ocinq+EN4FSRgX3kF95gMh19YrfQDafHlM+Xrp9itxOMNGuAntL
 TMlLF3zD/cS352VBpfUQFGgjkhHeMiBhg0DkT51nHUMZd9i9uAl+HIiJAKdnhhHc0avY6FOhXqJ
 0jC4IyE465vX1cy1xadCxbtH5GuMhaUAvYygb7EcDew5EyzW9sdwUr7xcf5p5xGFCs6hu5mASrz
 eK/oUVM9kATl9M
X-Received: by 2002:ac8:5dd1:0:b0:4e8:9140:f3c8 with SMTP id
 d75a77b69052e-4e89d3442b0mr300586751cf.53.1761220755733; 
 Thu, 23 Oct 2025 04:59:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGrkM4uYfq/lNpbDez8GrI0xNjJmLCd3bXoaTu6hgpwbrEYitSxf9CGp5WmH+cMNaQYf8QlBA==
X-Received: by 2002:ac8:5dd1:0:b0:4e8:9140:f3c8 with SMTP id
 d75a77b69052e-4e89d3442b0mr300586381cf.53.1761220755223; 
 Thu, 23 Oct 2025 04:59:15 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-592f4aded3bsm699017e87.8.2025.10.23.04.59.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Oct 2025 04:59:14 -0700 (PDT)
Date: Thu, 23 Oct 2025 14:59:12 +0300
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
Subject: Re: [PATCH 03/12] drm/msm/dpu: Compatible with Kaanapali interrupt
 register
Message-ID: <nfekr4vi34ftxzyyf5xv4tsb5cr3tokiyfkerypqjf26dos3uq@42wcn6ji7nnb>
References: <20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com>
 <20251023075401.1148-4-yuanjie.yang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251023075401.1148-4-yuanjie.yang@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAxNSBTYWx0ZWRfX7zH9tGe047R2
 ceIpMttHKcAha60+Iy+9sk6aNkanoTKU1BUxuDBeCkrG0MLGgC/nPzb8FqF3aTPnRtvRfBk9Wq8
 f2gi241Ksv012U5Tw/Xy3GJnod1B5fbuDrV5/Jf4tb47HIQnxRpY2rLTDkCVQBw2ACMzVIWfDMt
 RR05eVzfyCYtyeOWnt7xr1c9e77t1vCfk1c1ik+qWKlhUw8DzTzY5f8R2B39E7+36WFeo3z6mrg
 +6auKnxtkZW9xeVYMz/IkkDXUMd8VbTwyx6ATHF9lvCphcmBZwYoxH8BrgIMoldPKx6Eh63aDxD
 TvdEMLyk8nLRhH1WxJdI7TWip4K3aQLDayLyZVqa/sOO9lhL0SvksEdyFrzO35vD9gflOaEWQMx
 AdfgXezgmYJn51/B1zvNj9M2tc3w/A==
X-Authority-Analysis: v=2.4 cv=bNUb4f+Z c=1 sm=1 tr=0 ts=68fa1894 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=lgH9jh0Qp7VjnHBaTbUA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: 16_nIc7NwiV73kuFFfGaOuZvivzbAr9o
X-Proofpoint-ORIG-GUID: 16_nIc7NwiV73kuFFfGaOuZvivzbAr9o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180015
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

On Thu, Oct 23, 2025 at 03:53:52PM +0800, yuanjie yang wrote:
> From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> 
> DPU version 13 introduces changes to the interrupt register
> layout. Update the driver to support these modifications for
> proper interrupt handling.

So... Previous patch enabled support for the platform and it has been
using wrong registers for interrupts? I think that's broken.

> 
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> ---
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 89 ++++++++++++++++++-
>  1 file changed, 88 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> index 49bd77a755aa..8d265581f6ec 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> @@ -40,6 +40,15 @@
>  #define MDP_INTF_REV_7xxx_INTR_TEAR_STATUS(intf)	(MDP_INTF_REV_7xxx_TEAR_OFF(intf) + 0x004)
>  #define MDP_INTF_REV_7xxx_INTR_TEAR_CLEAR(intf)		(MDP_INTF_REV_7xxx_TEAR_OFF(intf) + 0x008)
>  
> +#define MDP_INTF_REV_13xx_OFF(intf)			(0x18D000 + 0x1000 * (intf))

Lowercase hex

> +#define MDP_INTF_REV_13xx_INTR_EN(intf)			(MDP_INTF_REV_13xx_OFF(intf) + 0x1c0)
> +#define MDP_INTF_REV_13xx_INTR_STATUS(intf)		(MDP_INTF_REV_13xx_OFF(intf) + 0x1c4)
> +#define MDP_INTF_REV_13xx_INTR_CLEAR(intf)		(MDP_INTF_REV_13xx_OFF(intf) + 0x1c8)
> +#define MDP_INTF_REV_13xx_TEAR_OFF(intf)		(0x18D800 + 0x1000 * (intf))
> +#define MDP_INTF_REV_13xx_INTR_TEAR_EN(intf)		(MDP_INTF_REV_13xx_TEAR_OFF(intf) + 0x000)
> +#define MDP_INTF_REV_13xx_INTR_TEAR_STATUS(intf)	(MDP_INTF_REV_13xx_TEAR_OFF(intf) + 0x004)
> +#define MDP_INTF_REV_13xx_INTR_TEAR_CLEAR(intf)		(MDP_INTF_REV_13xx_TEAR_OFF(intf) + 0x008)
> +
>  /**
>   * struct dpu_intr_reg - array of DPU register sets
>   * @clr_off:	offset to CLEAR reg

-- 
With best wishes
Dmitry
