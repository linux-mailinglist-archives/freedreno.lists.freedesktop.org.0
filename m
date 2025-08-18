Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D76F5B2B087
	for <lists+freedreno@lfdr.de>; Mon, 18 Aug 2025 20:35:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B151910E03A;
	Mon, 18 Aug 2025 18:35:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="AvjKASPb";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9200010E03A
 for <freedreno@lists.freedesktop.org>; Mon, 18 Aug 2025 18:35:29 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57IEboaU011391
 for <freedreno@lists.freedesktop.org>; Mon, 18 Aug 2025 18:35:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 LfY4G4CqKEkHfEGc9webJ8Mqx5xO+pkxGHroIuo5mZY=; b=AvjKASPbcVWwYskt
 0bn6JVWulXwUfOFRaszps5kb9D5NoNNW+HDMJINRW2jpYzFuRW9XF2Su0Uw4cXhF
 y0qSvjt9/mPVXu8nLMYJdwf87AeKNR/2Im/8vyWGUJdbcYuVcBndK9muoRJLJ/xh
 Nz0YJNL2fiF5PCUh6oo5HQbQNvowR0vb10hKZr75SBJSUOZI3Vlj66G2uXF2DVIN
 D89f1xjjNnhhIhugWOsfmP5TywGZ7nRZSrYic3JLq4SHe97YgjyPVeEQc4uXrMVJ
 733FptaxGEChuHzUDxpI6U4X+C1Qa+TcRrPTy53x+ihduKuWeDo2EhUAKro77YnW
 CBzjVQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jk5mdse6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 18 Aug 2025 18:35:28 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-24457f42254so106810815ad.0
 for <freedreno@lists.freedesktop.org>; Mon, 18 Aug 2025 11:35:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755542128; x=1756146928;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LfY4G4CqKEkHfEGc9webJ8Mqx5xO+pkxGHroIuo5mZY=;
 b=brxBo2KpqORpxhtgWik5LWf2kxrhEMkV/Gsp3GcrgbjsLvapzE/FMQC3JZRmeH9EZR
 TC4wC4Yh2Fw57B84lt2INThD6bWp0/IgvVu1uu9rxxpaZRB0iKgla2vFueaAvBjzJx3h
 LPX6CB0OYq5LJ/lvhE1JJe6OMAHaJkivHqxQ+JMlnaan7gdrprGfuvvqkO7Td8RGSEq6
 EBmjdfLKMBpTVxqWXPCN/cnoQB/mOeNf355TCfkENc4yjtBv2X+W2pWe5GjX8kN5t+6T
 v2V/a0Av3DZXBfjf+hnybkHz3VDusLsLeTc8MxPo8edNtrtBP8JKShVkz34R+CWR2Y4c
 0IPg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVOjie83vxWZIHAKuQzS66WBblUA2toqys+YqIaZOFyK416ggtl3/jBbcaO8mfR8m2Il1UWkaMWqTQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyZ0pfK3gTv7hr9bQGMOFD+jUaccHRBzOgir+WhtXnWFwMV0i01
 7VOLCJji5zhybSswdGb632P3ZjAr0wwe17xrKZFRd6yUUVWKY6DRSGEjYDy+RjWVQTmDzhqjoPQ
 R5hqExbQqAYJSBk1mSrMe5eWZe/rZ1VAP4gkQrWBOSa/5Y7wbFmqAlGs0GjewJ+EjMfqlpag=
X-Gm-Gg: ASbGnct5YWEUowGfpFITU8TFn9Rn0mSG6dMlNgdVj9vSHHJHEpmGhL31dXfd2X1zf4J
 eRAauoMDgrCHS3rIXiMFveN6M20PsRlCMAVizc19SU4l4AlNZm6a4AnNQnHUCI6s7Aqb7whzd7y
 1qSIBYOcNExKCI9dKEy4bYxs411s5MNUVqzdEmFF04t+b6O86ktrTc24X3EvKQd5V+W3RblpOWM
 jQFqu/oufFp5K00dGdI+fMFkwfgBw39Ui8Uf02ky8I6x0Bv8BMFdPMvQNB5ZzbZAghKd6NSORQs
 CY38pVh5pV2RldhN8qAcuOFDutK9YmQEOfo9xFsLT4s91GvKhOlLuWGh+pCAld37gkLcBp9szLD
 ggmtA+n8iJK2CL0xrfVvAoQ==
X-Received: by 2002:a17:903:2ac5:b0:23f:f3e1:7363 with SMTP id
 d9443c01a7336-2449cfb9e80mr5221425ad.23.1755542128032; 
 Mon, 18 Aug 2025 11:35:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IELuEhzg1tInCp2J0UUI+JjVQtMm+T8qI7xf/0+5/2hJCOJis2Fde9uo5MCZ53k19fKQnY75A==
X-Received: by 2002:a17:903:2ac5:b0:23f:f3e1:7363 with SMTP id
 d9443c01a7336-2449cfb9e80mr5220815ad.23.1755542127524; 
 Mon, 18 Aug 2025 11:35:27 -0700 (PDT)
Received: from [10.134.71.99] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2446d50f8easm87137675ad.97.2025.08.18.11.35.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Aug 2025 11:35:27 -0700 (PDT)
Message-ID: <41dacae0-0c66-493a-b5d8-a6df5f7e3b9e@oss.qualcomm.com>
Date: Mon, 18 Aug 2025 11:35:19 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/8] drm/msm/dpu: use drmm_writeback_connector_init()
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Louis Chauvet <louis.chauvet@bootlin.com>
References: <20250816-wb-drop-encoder-v2-0-f951de04f4f9@oss.qualcomm.com>
 <20250816-wb-drop-encoder-v2-5-f951de04f4f9@oss.qualcomm.com>
Content-Language: en-US
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
In-Reply-To: <20250816-wb-drop-encoder-v2-5-f951de04f4f9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Sdn3duRu c=1 sm=1 tr=0 ts=68a37270 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=QyXUC8HyAAAA:8 a=P-IC7800AAAA:8
 a=EUspDBNiAAAA:8 a=NHqv8PQFZmVaGbn79gkA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-ORIG-GUID: c4B2TyZxQRAhafqf_CEH_DAYLqogSIEJ
X-Proofpoint-GUID: c4B2TyZxQRAhafqf_CEH_DAYLqogSIEJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDA0MiBTYWx0ZWRfX6vLol8w9kPjF
 6AuY1aStJBYzaCMo/f9GtBt0akIaj/zq4nst9KFcMccmPTe8flPQ9+/vLlCAxCOX7jY+OvgDp9z
 pKmtCPk62Y+UJolpfBm6E+72MMlnwb78M1c5Rafnkc3Sz/siLjMI4kjT1JZDXm8Q/YGapatgP2I
 qba9uYHRaKSv5ZdTsCZdwRhL2ePduLXB2AhPa/PTyHeTBp8NDoucMevK8xAm3MgIIAeQwxg4eBy
 tXI5mHWsSWRGsUzpGQOoPWiFlpWI0T8bw05huxPTPV8Rp/8blQQJRKMlqYqHasVJzAVrFNn14cE
 UpK7nK+XaaszF73o4HKXrpVNaYmZbqEEE9MCEH7xeslKFQ39yMzUtBKrjyZFfBWDGdsDqNmdesy
 EL46/Lvf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-18_05,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 spamscore=0
 adultscore=0 malwarescore=0 bulkscore=0 phishscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508160042
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



On 8/16/2025 8:19 AM, Dmitry Baryshkov wrote:
> Use drmm_plain_encoder_alloc() to allocate simple encoder and
> drmm_writeback_connector_init() in order to initialize writeback
> connector instance.
> 
> Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
> Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Hey Dmitry,

Just a heads up, I think the commit message prefix here is incorrect.

Thanks,

Jessica Zhang

> ---
>   .../gpu/drm/renesas/rcar-du/rcar_du_writeback.c    | 23 +++++++++++++++-------
>   1 file changed, 16 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c
> index 8cd37d7b8ae281cbc1fd8cbb243c621174517e23..64cea20d00b38861e22fc53375ab41ae988ceb59 100644
> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c
> @@ -134,7 +134,6 @@ static void rcar_du_wb_conn_reset(struct drm_connector *connector)
>   static const struct drm_connector_funcs rcar_du_wb_conn_funcs = {
>   	.reset = rcar_du_wb_conn_reset,
>   	.fill_modes = drm_helper_probe_single_connector_modes,
> -	.destroy = drm_connector_cleanup,
>   	.atomic_duplicate_state = rcar_du_wb_conn_duplicate_state,
>   	.atomic_destroy_state = rcar_du_wb_conn_destroy_state,
>   };
> @@ -202,15 +201,25 @@ int rcar_du_writeback_init(struct rcar_du_device *rcdu,
>   {
>   	struct drm_writeback_connector *wb_conn = &rcrtc->writeback;
>   
> +	struct drm_encoder *encoder;
> +
> +	encoder = drmm_plain_encoder_alloc(&rcdu->ddev, NULL,
> +					   DRM_MODE_ENCODER_VIRTUAL, NULL);
> +	if (IS_ERR(encoder))
> +		return PTR_ERR(encoder);
> +
> +	drm_encoder_helper_add(encoder, &rcar_du_wb_enc_helper_funcs);
> +
> +	encoder->possible_crtcs = drm_crtc_mask(&rcrtc->crtc);
> +
>   	drm_connector_helper_add(&wb_conn->base,
>   				 &rcar_du_wb_conn_helper_funcs);
>   
> -	return drm_writeback_connector_init(&rcdu->ddev, wb_conn,
> -					    &rcar_du_wb_conn_funcs,
> -					    &rcar_du_wb_enc_helper_funcs,
> -					    writeback_formats,
> -					    ARRAY_SIZE(writeback_formats),
> -					    1 << drm_crtc_index(&rcrtc->crtc));
> +	return drmm_writeback_connector_init(&rcdu->ddev, wb_conn,
> +					     &rcar_du_wb_conn_funcs,
> +					     encoder,
> +					     writeback_formats,
> +					     ARRAY_SIZE(writeback_formats));
>   }
>   
>   void rcar_du_writeback_setup(struct rcar_du_crtc *rcrtc,
> 

