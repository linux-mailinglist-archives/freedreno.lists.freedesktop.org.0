Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC20CB52153
	for <lists+freedreno@lfdr.de>; Wed, 10 Sep 2025 21:44:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A93FA10E9CE;
	Wed, 10 Sep 2025 19:44:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="avc37zmE";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C326610E9CF
 for <freedreno@lists.freedesktop.org>; Wed, 10 Sep 2025 19:44:39 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ACgFKu021214
 for <freedreno@lists.freedesktop.org>; Wed, 10 Sep 2025 19:44:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=MRFwGcw4G0+ktZMni3vfLtmQ
 O/YRU2ZQtqpoFx/hjaA=; b=avc37zmEzVW7YjVsxItPhtWI22GJZQQOvskkWisI
 fAPD0eUnTWrwGwoiLO6/vxsGmyPbq3IOT3bDNSVNVJ9Cb2MPH1f/YAmv7QAcY8Lh
 yTzmcpRFSSiZfYNDmLTj7y+7A+m6xea7WQH0GmwOe5wmaLw5jv5tY2TEC0YocBab
 CzOvW1/dr2D6JZc7kOT9YGSwQkckprDcudn/1rdT9By0GObcCpBRtPZxTT2b7c1e
 QPuKJ5WTYEV9Uc7qEOByIVZQUFjqVgbtBlcdN/okWE5aChurpHzl8cLP8lDRQrBc
 PU9xSiqsSMWBtA8NUcn7IkT2woCXAPQ+JlIxcIPC+4K4PA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490by953vy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 10 Sep 2025 19:44:38 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-71ffd145fa9so11534426d6.2
 for <freedreno@lists.freedesktop.org>; Wed, 10 Sep 2025 12:44:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757533478; x=1758138278;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MRFwGcw4G0+ktZMni3vfLtmQO/YRU2ZQtqpoFx/hjaA=;
 b=Xjrl472iJ9qub3/1GfGIOT6f9cB3pzIDiMk8Ozo0ZOYSJZPF96y/Ky8pUV8x+m5CDp
 cl4ZjIS86eUTvaulzrJLUjwhRx0fYzakf3fGSPjLWaz6ien8bjvbgW+btVytH9bxDJC8
 WZBCSGZeQDUo2ghVprf8NpWcQ23YelVa5jqpLIpqrB3ny1W7zMAWMJk0wMHgD/W+utxk
 C9wq8MkNATPDrbcOaPj566H93JHu1jgGmzWm4CsDq2EYbICa4W+NG/3ADylQNKVWkWOH
 zvf+YkK0XqXW+0K5JVLDiAyuOjeCZru8jn/PnUTv8bpJilIvWo9+G+95V4DaasCmoBV0
 KKBw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVGchDJe2Z3Qqm1FAHjN7+0bv0w1lNRL7v4JZRGMbVo9ge7IM1rGHVw0OuUKHrcEnZ64JnlHEjvC84=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx4kcvQ96vT0KtJN5RnDvH1ZF5dO5MUwpr0xv/YJvam2uY4S7Y8
 TynIttcRtp2TEwZ1FP1GnQyMl6y4/lpPYpoICkqqnvxe7ZdXVC358bpJL6kzKJ/t84DprA6HViP
 uxfSjOI1JKpnx3GNw2wtY/o4+bn0dS/HR06x1hs/3ytbQSddxUc2xIIpOHyA7zBIBORvUAbA=
X-Gm-Gg: ASbGncul0UE6BhMGWXzjssUXogMjQfPIfw8O24R3PKqq5wt2VvB/sDfy30s4PnDXJ0A
 Je9Fj+cOZnWoyxlsqO+XcpTKtdRwmgOD0Y7Oz8CAlNREm7aJXptxB8tnNotesxrGm+eTpJhpDfr
 C4me2dm36mxJabGV/lhs6FHU8coMiPZQEwogvXTnTbKkPfFdV+zimoNN1eA75ZIHr9DPLQAO15E
 k5gp0UXMfcl4yatNPVecKPtey6qyMVohxI5UICJXKQ1E8ht7NmgQDFCxYzUU5bo9uqcSOXYuCeO
 dzO7G7ILWnPZ+WbIAeEVIUXMZgRT141qKzHE0s91PHfkbxbdog0DX8y67M/zyVyjCZr51ERi22N
 XhIJFhzH8tVyblwN5rg3QaqNlsPTGp1SgEfmjVC14Sis7tb1IS2IX
X-Received: by 2002:a05:6214:d83:b0:722:4cf0:43ca with SMTP id
 6a1803df08f44-7393ec165cfmr207443116d6.36.1757533477913; 
 Wed, 10 Sep 2025 12:44:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHLTybLfL00fFfCA42iPicU5GPH+S6SfBfiUJaoauFhGCNadtLOwQ0vunk0e3CAte+J5/R2vA==
X-Received: by 2002:a05:6214:d83:b0:722:4cf0:43ca with SMTP id
 6a1803df08f44-7393ec165cfmr207442566d6.36.1757533477313; 
 Wed, 10 Sep 2025 12:44:37 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-337f4c4ffd5sm43997081fa.14.2025.09.10.12.44.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Sep 2025 12:44:35 -0700 (PDT)
Date: Wed, 10 Sep 2025 22:44:32 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Suraj Kandpal <suraj.kandpal@intel.com>
Cc: kernel-list@raspberrypi.com, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, ankit.k.nautiyal@intel.com,
 arun.r.murthy@intel.com, uma.shankar@intel.com, jani.nikula@intel.com,
 harry.wentland@amd.com, siqueira@igalia.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch,
 liviu.dudau@arm.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, robin.clark@oss.qualcomm.com,
 abhinav.kumar@linux.dev, tzimmermann@suse.de,
 jessica.zhang@oss.qualcomm.com, sean@poorly.run,
 marijn.suijten@somainline.org,
 laurent.pinchart+renesas@ideasonboard.com, mcanal@igalia.com,
 dave.stevenson@raspberrypi.com, tomi.valkeinen+renesas@ideasonboard.com,
 kieran.bingham+renesas@ideasonboard.com, louis.chauvet@bootlin.com
Subject: Re: [PATCH 2/7] drm: writeback: Modify writeback init helpers
Message-ID: <nw4ehd7a655rzyf6g5yxb3z25en45esja2i5uowzy4wpmb2el6@orycag5iccho>
References: <20250909100649.1509696-1-suraj.kandpal@intel.com>
 <20250909100649.1509696-3-suraj.kandpal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250909100649.1509696-3-suraj.kandpal@intel.com>
X-Authority-Analysis: v=2.4 cv=Yv8PR5YX c=1 sm=1 tr=0 ts=68c1d526 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=QyXUC8HyAAAA:8 a=T65gB5C1oy4ZwBZl7KYA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: n0PI54u4IkcIFEjGfMNRPjfX5pJ-gZAn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAxOCBTYWx0ZWRfX5BDUICupAdh+
 RLh/HYboaVbCNk+LkmMUINcM9GMPr5CuWr84SU4nhxtR2JJrhgbmYCv305wVONdjT47A3XLJUbI
 CxczXocg85ELAs8SnkFqlz9o4GvlaM426oUey41lny0LS4XLiuky5dMK5pXFa6IlZWw+iBKfwsu
 pGZw+UzV8dYtsIJut29LBvWYIl7cXcs2t1A/i3G63Xz9gPkg28DnL4BsksUzb6zO4dKBHZvv5jG
 H2hj0ov4WjhO9cDSIxZ4/C6ATsvFY5UoMl9lx+Plqn4hFiHaLbb0O/0Gqi/bfro5KS1qwNxrFa/
 2om2JxBvm8IjcbT3LhfsrhrgcWcpFTdNZyq5sgayRJS1hbQJ7CiHRm+s6c72wsE+vFiAth3wj2Y
 6sys/PzW
X-Proofpoint-ORIG-GUID: n0PI54u4IkcIFEjGfMNRPjfX5pJ-gZAn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060018
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

On Tue, Sep 09, 2025 at 03:36:44PM +0530, Suraj Kandpal wrote:
> Now with drm_writeback_connector moved to drm_connector it makes
> more sense use drm_connector as an argument rather than drm_connector.

than drm_writeback_connector

> The writeback connector can easily be derived from drm_connector.
> 
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> ---
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c |  2 +-
>  .../drm/arm/display/komeda/komeda_wb_connector.c |  5 +----
>  drivers/gpu/drm/arm/malidp_mw.c                  |  2 +-
>  drivers/gpu/drm/drm_writeback.c                  | 16 ++++++++--------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c    |  2 +-
>  .../gpu/drm/renesas/rcar-du/rcar_du_writeback.c  |  3 +--
>  drivers/gpu/drm/vc4/vc4_txp.c                    |  2 +-
>  drivers/gpu/drm/vkms/vkms_writeback.c            |  4 ++--
>  include/drm/drm_writeback.h                      |  4 ++--
>  9 files changed, 18 insertions(+), 22 deletions(-)
> 
> @@ -338,13 +338,13 @@ static void drm_writeback_connector_cleanup(struct drm_device *dev,
>   * Returns: 0 on success, or a negative error code
>   */
>  int drmm_writeback_connector_init(struct drm_device *dev,
> -				  struct drm_writeback_connector *wb_connector,
> +				  struct drm_connector *connector,
>  				  const struct drm_connector_funcs *con_funcs,
>  				  struct drm_encoder *enc,
>  				  const u32 *formats, int n_formats)
>  {
> -	struct drm_connector *connector =
> -		drm_writeback_to_connector(wb_connector);
> +	struct drm_writeback_connector *wb_connector =
> +		drm_connector_to_writeback(connector);

You can use &connector->writeback without extra wrappers.

>  	int ret;
>  
>  	ret = drmm_connector_init(dev, connector, con_funcs,

-- 
With best wishes
Dmitry
