Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63FCFB44728
	for <lists+freedreno@lfdr.de>; Thu,  4 Sep 2025 22:19:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBE0910E08D;
	Thu,  4 Sep 2025 20:19:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="LlUmau70";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E7B410E08D
 for <freedreno@lists.freedesktop.org>; Thu,  4 Sep 2025 20:19:23 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 584In6SK003821
 for <freedreno@lists.freedesktop.org>; Thu, 4 Sep 2025 20:19:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=jWUNPuAEFI7JhvBCvnX55AlM
 FNdm2ykDPTbZ1bebaeI=; b=LlUmau709APIAZJv07SIRxbrcWaOjAIlpCqDCpOL
 UkS8iDsrKpDMR1yQRPuZMMZXSbNIoKg2U7KiKjdZHNSWhuJc/nQLAN2AQHt4Dz7Z
 FJh9XZxqrb2RFVz7xetDKWowFWiT3EqhWFJpfM4PfF2GQig0AhIxeTfAR/OH8egS
 XA5k40IT+eIOAj4lfpLsd2sy6SDIyb7o0oxeoyFW3xdzGXLjxQ4e7qU/YCr72wer
 RbFB2sABL+DQYIZDdPViNiUBLT0swhIVax9eB3/Gj+JKWg0vwqWpwdiLRTD/DQWr
 bp27CjFNyaPBg1hmXlE5wHuqpxuLX4o/iHUtUK4jtHgmuA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ur8s8uft-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 04 Sep 2025 20:19:21 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4b32b721a23so42472091cf.0
 for <freedreno@lists.freedesktop.org>; Thu, 04 Sep 2025 13:19:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757017160; x=1757621960;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jWUNPuAEFI7JhvBCvnX55AlMFNdm2ykDPTbZ1bebaeI=;
 b=HO1V+YEf1sfKj48tujL2Uv9auXpKvToYSLyGOieU8Rb0AA4Rlth1D6jmiBdwfqLfj4
 uc0R02HSA8qLjzVGkY5RwAFnnGQ29dOsDLJeeGf60069nMoU2/nunetB8zTBGnnVsVge
 qMyAJ7IS6TrJ1I9YmedFBU6pKdNGJ4ct+0sWtr227MFqoNlC3A52ys3AasYQPQqnNOSg
 kXX/6GyI8bV1Uzv7UKrLQzCq/ycPer5X5nz6AWrtoDhn/wtLqQeMAflIL11HhWe8fadW
 8i56Ug6PTuVRQuBZFzmLsp0dZKy8ImS3oAUwvuwzdkzI4dQErSoMcJj1UNHsEHpISzCN
 bthg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUU+VPhgHXRNFqfBgMAotzaGdRJAMRrZQBIg0Dj9m4wW6K5Bj5MsZaFf7yiJthv2jFOX3ytpdqwP84=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw/kFmA5WuS8gsmR5dYgzqd/ZKbzTUUweY8ZGiCdiEKhFxzwWlS
 ClhW/MXtvel/7XPA3pDtK7m9NO2qWspVhXcrSFbwGWOqmjXrt0+cuD9D1S7jBLpwol3oCTjMRZF
 vNZ7nqBaIBlgm517qZoqNDTTxOWmbsAeMdd3QwelGHM1P7PYxCzynZGQIYD515DOCWMzxmBY=
X-Gm-Gg: ASbGncsqu0cUhvz9Frmv0NNbsEjDCO10R4Y80uHipLZNcOKFJEYFg0wDEfo4uNmoqWZ
 pzLdFvhOjHhrfKOAzDeMc/jLY55dONpp9az4eV0tFulwmSEKdgMVDgmT2CjLQHUrjYza/OZCnnK
 UfsGu22uPQdxB/oUvA4EYWuz05PDK/vELci6JTxDfF8igLJkL/v8UVA5xPD4vyl396KCUMquQzP
 iohz2XvBSXPFUdUqYB73aAGgwNGQHR+cZ6ZtQ46iOY8EmH7Z3NGcGsxZb5xaMDWH3lsSpXNY2LG
 6bKgsaSB1QmEt3Ip6QO7xJoCYrAoQyP4crv6ehOqeSS5LsTeoGI+OQ7j3P1kig6JeYfIo7lghO2
 JqszZL9ieqTPdeDokgnaYWQDBAgNATp6tHY2ssgUINjHiPiKzyEPB
X-Received: by 2002:a05:622a:2518:b0:4b5:d7e3:14a9 with SMTP id
 d75a77b69052e-4b5d7e31a96mr37976291cf.17.1757017160106; 
 Thu, 04 Sep 2025 13:19:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHJcRQsxcgT+uSNce80CLe8CYyvhDKUkldf2jsGuUpffbpj69zWEbc4KJJjbhdYWm1raJiMhA==
X-Received: by 2002:a05:622a:2518:b0:4b5:d7e3:14a9 with SMTP id
 d75a77b69052e-4b5d7e31a96mr37975871cf.17.1757017159540; 
 Thu, 04 Sep 2025 13:19:19 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-337f4c90eb9sm16137861fa.22.2025.09.04.13.19.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Sep 2025 13:19:17 -0700 (PDT)
Date: Thu, 4 Sep 2025 23:19:14 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 12/12] drm/msm/dpu: use standard functions in
 _dpu_format_populate_plane_sizes_ubwc()
Message-ID: <k7vorukb6rockoanjdebfjw3iio4l5nu3u6hdqyi4ke4cp3h66@omwo5bjxbt4t>
References: <20250705-dpu-formats-v1-0-40f0bb31b8c8@oss.qualcomm.com>
 <20250705-dpu-formats-v1-12-40f0bb31b8c8@oss.qualcomm.com>
 <c2d810bc-bdba-464b-9a05-49ca2e1c773b@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c2d810bc-bdba-464b-9a05-49ca2e1c773b@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAxOSBTYWx0ZWRfX0qOEYHm5TpU9
 tZNRppTrqtEde58+uZEtP3YPeCqJ1oW3hRRPaHp6jIt3v1nDP+O9TPzgLC0VbHxh6XWZvyGQj9z
 nVoVSU4Ku7j3aCR+77MoW9mjIaezYBfPXUtKproGlpAJq7e9q+01DOHTixG00lf+JTHWwZqfGxI
 lla0XXAti5h5JOi5xdF3NtKecUECr/H0XPg1y2M5aJAozczeJfQsdGksoqvCB9ceas3f4jz/bfz
 xj8rYBCJ1LcXtKjgH9wX3TZwmb7/IWwZ2i94hpkxbUCXzlmQoAHx9xK8XGnZvL1dB67u6QpK8Xd
 v2y/pnv8yIe5EKaYnpwzaDgiITII7PC6EhlmaLJuZN7ea7qKvZ8qlUIdyKceUFmhX8L2TK4yXdM
 mMjbRAsS
X-Proofpoint-GUID: 6N8YobPmfbaH1JJLHqy6NJ7poQE-qfnT
X-Proofpoint-ORIG-GUID: 6N8YobPmfbaH1JJLHqy6NJ7poQE-qfnT
X-Authority-Analysis: v=2.4 cv=PNkP+eqC c=1 sm=1 tr=0 ts=68b9f449 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=ncykOhDuLf7TmHMgJ_oA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_06,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300019
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

On Thu, Sep 04, 2025 at 11:38:16AM -0700, Jessica Zhang wrote:
> 
> 
> On 7/4/2025 7:47 PM, Dmitry Baryshkov wrote:
> > The _dpu_format_populate_plane_sizes_ubwc() used MSM_MEDIA_ALIGN() and
> > MSM_MEDIA_ROUNDUP(), macros inherited from the previous implementation,
> > msm_media_info.h. Replace them with the standard Linux macros,
> > round_up() and DIV_ROUND_UP() respectively.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c | 62 ++++++++++++-----------------
> >   1 file changed, 26 insertions(+), 36 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
> > index 67bc5a6eeb43dcf113dea9eccdb778cd52b1ad40..6a0426ed1460c5af4822844d7a7b0c51739df875 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
> > @@ -10,16 +10,6 @@
> >   #include "dpu_kms.h"
> >   #include "dpu_formats.h"
> > -#ifndef MSM_MEDIA_ALIGN
> > -#define MSM_MEDIA_ALIGN(__sz, __align) (((__align) & ((__align) - 1)) ?\
> > -	((((__sz) + (__align) - 1) / (__align)) * (__align)) :\
> > -	(((__sz) + (__align) - 1) & (~((__align) - 1))))
> > -#endif
> > -
> > -#ifndef MSM_MEDIA_ROUNDUP
> > -#define MSM_MEDIA_ROUNDUP(__sz, __r) (((__sz) + ((__r) - 1)) / (__r))
> > -#endif
> > -
> >   #define DPU_UBWC_PLANE_SIZE_ALIGNMENT	4096
> >   /*
> > @@ -80,57 +70,57 @@ static int _dpu_format_populate_plane_sizes_ubwc(
> >   		    fmt->pixel_format == DRM_FORMAT_P010) {
> >   			if (MSM_FORMAT_IS_DX(fmt)) {
> >   				if (fmt->flags & MSM_FORMAT_FLAG_UNPACK_TIGHT) {
> > -					stride = MSM_MEDIA_ALIGN(fb->width, 192);
> > -					stride = MSM_MEDIA_ALIGN(stride * 4 / 3, 256);
> > +					stride = round_up(fb->width, 192);
> 
> Hi Dmitry,
> 
> It seems like the usage of round_up() here might be incorrect -- the docs
> say "round up to next specified power of 2".
> 
> Maybe we should use roundup() instead here?


Indeed, two macros with very simlar names. Thanks for spotting it!

> 
> The rest of the patch LGTM.
> 
> Thanks,
> 
> Jessica Zhang
> 
> > +					stride = round_up(stride * 4 / 3, 256);
> >   					y_tile_width = 48;
> >   				} else {
> > -					stride = MSM_MEDIA_ALIGN(fb->width * 2, 256);
> > +					stride = round_up(fb->width * 2, 256);
> >   					y_tile_width = 32;
> >   				}
> > -				sclines = MSM_MEDIA_ALIGN(fb->height, 16);
> > +				sclines = round_up(fb->height, 16);
> >   				y_tile_height = 4;
> >   			} else {
> > -				stride = MSM_MEDIA_ALIGN(fb->width, 128);
> > +				stride = round_up(fb->width, 128);
> >   				y_tile_width = 32;
> > -				sclines = MSM_MEDIA_ALIGN(fb->height, 32);
> > +				sclines = round_up(fb->height, 32);
> >   				y_tile_height = 8;
> >   			}
> >   		}
> >   		layout->plane_pitch[0] = stride;
> > -		layout->plane_size[0] = MSM_MEDIA_ALIGN(layout->plane_pitch[0] *
> > +		layout->plane_size[0] = round_up(layout->plane_pitch[0] *
> >   			sclines, DPU_UBWC_PLANE_SIZE_ALIGNMENT);
> >   		layout->plane_pitch[1] = stride;
> > -		layout->plane_size[1] = MSM_MEDIA_ALIGN(layout->plane_pitch[1] *
> > +		layout->plane_size[1] = round_up(layout->plane_pitch[1] *
> >   			sclines, DPU_UBWC_PLANE_SIZE_ALIGNMENT);
> >   		if (!meta)
> >   			return 0;
> > -		y_meta_stride = MSM_MEDIA_ROUNDUP(fb->width, y_tile_width);
> > -		layout->plane_pitch[2] = MSM_MEDIA_ALIGN(y_meta_stride, 64);
> > +		y_meta_stride = DIV_ROUND_UP(fb->width, y_tile_width);
> > +		layout->plane_pitch[2] = round_up(y_meta_stride, 64);
> > -		y_meta_scanlines = MSM_MEDIA_ROUNDUP(fb->height, y_tile_height);
> > -		y_meta_scanlines = MSM_MEDIA_ALIGN(y_meta_scanlines, 16);
> > -		layout->plane_size[2] = MSM_MEDIA_ALIGN(layout->plane_pitch[2] *
> > +		y_meta_scanlines = DIV_ROUND_UP(fb->height, y_tile_height);
> > +		y_meta_scanlines = round_up(y_meta_scanlines, 16);
> > +		layout->plane_size[2] = round_up(layout->plane_pitch[2] *
> >   			y_meta_scanlines, DPU_UBWC_PLANE_SIZE_ALIGNMENT);
> > -		uv_meta_stride = MSM_MEDIA_ROUNDUP((fb->width+1)>>1, y_tile_width / 2);
> > -		layout->plane_pitch[3] = MSM_MEDIA_ALIGN(uv_meta_stride, 64);
> > +		uv_meta_stride = DIV_ROUND_UP((fb->width+1)>>1, y_tile_width / 2);
> > +		layout->plane_pitch[3] = round_up(uv_meta_stride, 64);
> > -		uv_meta_scanlines = MSM_MEDIA_ROUNDUP((fb->height+1)>>1, y_tile_height);
> > -		uv_meta_scanlines = MSM_MEDIA_ALIGN(uv_meta_scanlines, 16);
> > -		layout->plane_size[3] = MSM_MEDIA_ALIGN(layout->plane_pitch[3] *
> > +		uv_meta_scanlines = DIV_ROUND_UP((fb->height+1)>>1, y_tile_height);
> > +		uv_meta_scanlines = round_up(uv_meta_scanlines, 16);
> > +		layout->plane_size[3] = round_up(layout->plane_pitch[3] *
> >   			uv_meta_scanlines, DPU_UBWC_PLANE_SIZE_ALIGNMENT);
> >   	} else {
> >   		unsigned int rgb_scanlines, rgb_meta_scanlines, rgb_meta_stride;
> > -		layout->plane_pitch[0] = MSM_MEDIA_ALIGN(fb->width * fmt->bpp, 256);
> > -		rgb_scanlines = MSM_MEDIA_ALIGN(fb->height, 16);
> > -		layout->plane_size[0] = MSM_MEDIA_ALIGN(layout->plane_pitch[0] *
> > +		layout->plane_pitch[0] = round_up(fb->width * fmt->bpp, 256);
> > +		rgb_scanlines = round_up(fb->height, 16);
> > +		layout->plane_size[0] = round_up(layout->plane_pitch[0] *
> >   			rgb_scanlines, DPU_UBWC_PLANE_SIZE_ALIGNMENT);
> >   		if (!meta)
> > @@ -139,13 +129,13 @@ static int _dpu_format_populate_plane_sizes_ubwc(
> >   		/* uAPI leaves plane[1] empty and plane[2] as meta */
> >   		layout->num_planes += 1;
> > -		rgb_meta_stride = MSM_MEDIA_ROUNDUP(fb->width, 16);
> > -		layout->plane_pitch[2] = MSM_MEDIA_ALIGN(rgb_meta_stride, 64);
> > +		rgb_meta_stride = DIV_ROUND_UP(fb->width, 16);
> > +		layout->plane_pitch[2] = round_up(rgb_meta_stride, 64);
> > -		rgb_meta_scanlines = MSM_MEDIA_ROUNDUP(fb->height, 4);
> > -		rgb_meta_scanlines = MSM_MEDIA_ALIGN(rgb_meta_scanlines, 16);
> > +		rgb_meta_scanlines = DIV_ROUND_UP(fb->height, 4);
> > +		rgb_meta_scanlines = round_up(rgb_meta_scanlines, 16);
> > -		layout->plane_size[2] = MSM_MEDIA_ALIGN(layout->plane_pitch[2] *
> > +		layout->plane_size[2] = round_up(layout->plane_pitch[2] *
> >   			rgb_meta_scanlines, DPU_UBWC_PLANE_SIZE_ALIGNMENT);
> >   	}
> > 
> 

-- 
With best wishes
Dmitry
