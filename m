Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 866ABA9C36C
	for <lists+freedreno@lfdr.de>; Fri, 25 Apr 2025 11:28:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4478010E8DD;
	Fri, 25 Apr 2025 09:28:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="mQfJItrK";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06C5A10E8E2
 for <freedreno@lists.freedesktop.org>; Fri, 25 Apr 2025 09:28:09 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53P8T7bP015410
 for <freedreno@lists.freedesktop.org>; Fri, 25 Apr 2025 09:28:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=xt2jjx4txmL59hNW/slqoBCJ
 /oGYSTNA7mQ8pWiEl4c=; b=mQfJItrKW7QKh1CevTs4eVfDZpk+xBmfsJ8ePfyr
 MgXxxMg3u2dgrr9RSzxFr9XbRswUPTH+hxBv7oQDcYv2Teli2ugzwXsX+l3hABqN
 aoQfN66dTCS+BqsgAinm9a3y3KMtVtU5oMaFdOh2iBBJiQQmCYBnc+dMC7bVJLeo
 I0g80pPZkllaFWAomLm5UI81/VsbNyJJvWCeALOkng4plnQj4JF6cVM17Spkd6jq
 od8pEIWi0ifYu/hkQ90atrmCfFyZCBoNPD1dDmfjC8MBH2Z0FWYibU4UiX3JCcEO
 DJEP1Ur5hWgMXAoy6BY0iH5ey4ypHT7Hk+VTBGaz7aFz8w==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3gdtu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 25 Apr 2025 09:28:08 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-22aa75e6653so18266365ad.0
 for <freedreno@lists.freedesktop.org>; Fri, 25 Apr 2025 02:28:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745573287; x=1746178087;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xt2jjx4txmL59hNW/slqoBCJ/oGYSTNA7mQ8pWiEl4c=;
 b=EzDMJGgcD/HtHDPCwU4gfzECzvnqUkkfzJW5Q4huKgpMV6DUJv+m9uiTgGBy9O9/x9
 kDepK0UORfJ+IFm1Ju+ikrGsxXL7hSxjGNS2GeX4/E7UmtSHsHihQ8M1Y8nOILLzoesc
 n3Vp+U6RuI/mKU3CAO0Xr/NCbAPRD/99hn4ghTJSNiT4ih4j99tKOA5UCcX+mnGFxyiR
 245Zyg1G15jTessjOznX+qkH4HhscPCBRhlWFBT5nmJzCBqJSNLYQuNbO1Lw55RXIYdU
 SQ2p+ZqOXssaxFytkenoDG5Ff9nC0JS0BUO6FRHS6S0TQFRPqrrfL427smkAYSVGPhJh
 WWgA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUa/kXrfPaFoofWyCsV6kssvsTHpM5haAhXKb0BXqgQSrLU6OOUi5wsn5H6foGmV/iWWM6s96iAaBs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzxK9AqikbFm5afnHeGrybHwAXUhQLx66LRWMCJN4ilJor0fi3D
 K/XYscsj/vpP4KsPv84CKUVD842J5B2s+eJPBfzm5qoX1RNn5y4uGtNecag+bovNeHdsuCDM4bS
 uia5tEkZGdXYFxph7rUOhUbbmfuRDxa5y/rypCNr/ZVUEi72jp9SHvPYuK3PIjsV4rOS+KOgZ8g
 anuQG7rabazOiHA3e4yElEMU0M0kpsVOD+cTEU/zSScg==
X-Gm-Gg: ASbGncsrP5+LJiuKu4upCho87VJhvSnZ/yvMKBNQoE0VFSZFnjhSDyhfYG6Jq99TMyw
 tohApaTxUqe/Tv4YETuVVLHIq17zBCOWO7ZE0YXGykHebWclqbY7+XQEXxp3f9g3FPboXSfW9ml
 ybknd1qbk=
X-Received: by 2002:a17:902:ecc2:b0:224:1ec0:8a16 with SMTP id
 d9443c01a7336-22dbf5ee6c8mr22878815ad.21.1745573286932; 
 Fri, 25 Apr 2025 02:28:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG7sY9pNe21FkhpOVYLUJOVzPn9xf8OZzxysQbok+sCqT4QpEP41QTCap95a4a+qxhM7yJVJ2G9ynG4MaRKCCk=
X-Received: by 2002:a17:902:ecc2:b0:224:1ec0:8a16 with SMTP id
 d9443c01a7336-22dbf5ee6c8mr22878495ad.21.1745573286549; Fri, 25 Apr 2025
 02:28:06 -0700 (PDT)
MIME-Version: 1.0
References: <20250227-fd-mdp4-lvds-v3-0-c983788987ae@linaro.org>
 <20250227-fd-mdp4-lvds-v3-6-c983788987ae@linaro.org>
 <63e5ddf6-151a-42aa-b2cf-003d91b34a04@quicinc.com>
 <s63lvzn35d7xcvw3kkmtasyinxbqa35juyxosdscfk6vhty4pw@hu3dotyklo3r>
 <402bbda7-33c6-49b2-89c7-37372cc07457@quicinc.com>
In-Reply-To: <402bbda7-33c6-49b2-89c7-37372cc07457@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 25 Apr 2025 12:27:55 +0300
X-Gm-Features: ATxdqUHcGBSXlw8hFJp5C9Ri6LceneKkEY0gyZGnRt8lLgLrZ0UNEEiCOxxayBo
Message-ID: <CAO9ioeXhjrOyKz3N3oU6QxW+u6WUC4R5XXqWgb=7iF7Hk0Q_nQ@mail.gmail.com>
Subject: Re: [PATCH v3 6/7] drm/msm/mdp4: switch LVDS to use
 drm_bridge/_connector
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-ORIG-GUID: NPRJpUw9YOnZS27yJX_21IhYIF8szb1z
X-Proofpoint-GUID: NPRJpUw9YOnZS27yJX_21IhYIF8szb1z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDA2OCBTYWx0ZWRfX00ELju8ygr/9
 7N2gjnk2IIJgk2Zc7GveFfT5Gt72x5OlpDTUMDliVXQEHAwlF/uMzoJEI9Dy0lOFRs3WcbV8sJX
 oKD8hP/5SPxuVvHBSuHyzPT9TUQa17VfQgA6PnkqyYhR8bI8DnmmoTo2pVjBPsM7PHFpZ6bd4fV
 RwifAJNNbSW6+biYxRpd7IzEjNAw21ItrYLfrl65l+OZrw4Rep7RCU3oczPxX6mO72Ki1FmgwgC
 lvj2HsWdfmt7iVupZi5MWRleMFyp8OQTbpJol4+8+o9jxOqS/AcT93tR+SQT/lAkpTQTRq4dzzN
 2gCpxDW9XtmatUPfYTPd2sNeeHEGdpoGuhsab8WHKuc1mTmOklv073sQT70Fc6jM157tjL9TBF2
 WDtsU58sqnLBiHLNBNBZkKtNl19SoNie5Rv8ljp5zHvg9TA2/0RUb+le3QmQBBk/xXRlUSgL
X-Authority-Analysis: v=2.4 cv=Mepsu4/f c=1 sm=1 tr=0 ts=680b55a8 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10
 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8 a=ZLr3lU9xobrfYbAAIvMA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_02,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 mlxscore=0 impostorscore=0 clxscore=1015
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250068
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

On Fri, 25 Apr 2025 at 00:00, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 4/24/2025 3:23 AM, Dmitry Baryshkov wrote:
> > On Wed, Apr 23, 2025 at 07:04:16PM -0700, Abhinav Kumar wrote:
> >>
> >>
> >> On 2/26/2025 6:25 PM, Dmitry Baryshkov wrote:
> >>> LVDS support in MDP4 driver makes use of drm_connector directly. However
> >>> LCDC encoder and LVDS connector are wrappers around drm_panel. Switch
> >>> them to use drm_panel_bridge/drm_bridge_connector. This allows using
> >>> standard interface for the drm_panel and also inserting additional
> >>> bridges between encoder and panel.
> >>>
> >>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>> ---
> >>>    drivers/gpu/drm/msm/Makefile                       |   1 -
> >>>    drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c           |  34 +++++--
> >>>    drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h           |   6 +-
> >>>    drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c  |  20 +----
> >>>    .../gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c    | 100 ---------------------
> >>>    5 files changed, 28 insertions(+), 133 deletions(-)
> >>>
> >>> @@ -199,27 +201,43 @@ static int mdp4_modeset_init_intf(struct mdp4_kms *mdp4_kms,
> >>>              * bail out early if there is no panel node (no need to
> >>>              * initialize LCDC encoder and LVDS connector)
> >>>              */
> >>> -           panel_node = of_graph_get_remote_node(dev->dev->of_node, 0, 0);
> >>> -           if (!panel_node)
> >>> -                   return 0;
> >>> +           next_bridge = devm_drm_of_get_bridge(dev->dev, dev->dev->of_node, 0, 0);
> >>> +           if (IS_ERR(next_bridge)) {
> >>> +                   ret = PTR_ERR(next_bridge);
> >>> +                   if (ret == -ENODEV)
> >>> +                           return 0;
> >>> +                   return ret;
> >>> +           }
> >>> -           encoder = mdp4_lcdc_encoder_init(dev, panel_node);
> >>> +           encoder = mdp4_lcdc_encoder_init(dev);
> >>>             if (IS_ERR(encoder)) {
> >>>                     DRM_DEV_ERROR(dev->dev, "failed to construct LCDC encoder\n");
> >>> -                   of_node_put(panel_node);
> >>>                     return PTR_ERR(encoder);
> >>>             }
> >>>             /* LCDC can be hooked to DMA_P (TODO: Add DMA_S later?) */
> >>>             encoder->possible_crtcs = 1 << DMA_P;
> >>> -           connector = mdp4_lvds_connector_init(dev, panel_node, encoder);
> >>> +           ret = drm_bridge_attach(encoder, next_bridge, NULL, DRM_BRIDGE_ATTACH_NO_CONNECTOR);
> >>> +           if (ret) {
> >>> +                   DRM_DEV_ERROR(dev->dev, "failed to attach LVDS panel/bridge: %d\n", ret);
> >>> +
> >>> +                   return ret;
> >>> +           }
> >>
> >> Can you pls point me to the lvds bridge used with this apq8064 board? I was
> >> unable to find it. Just wanted to compare that against this while reviewing.
> >
> > It's the panel bridge, wrapping one of the LVDS panels.
> >
>
> Yes but what I wanted to check was which LVDS panel was being used so
> far. Looks like for arm32 the dts is missing? As I couldnt find the lvds
> out endpoint. So can you pls point me to the lvds panel you verified
> this with?

I used the AUO b101xtn01 panel connected to the LVDS connector on the
IFC6410. I'm not posting DT bits since the panel is not a part of the
kit.

>
>
> >>> +
> >>> +           connector = drm_bridge_connector_init(dev, encoder);
> >>>             if (IS_ERR(connector)) {
> >>>                     DRM_DEV_ERROR(dev->dev, "failed to initialize LVDS connector\n");
> >>> -                   of_node_put(panel_node);
> >>>                     return PTR_ERR(connector);
> >>>             }
> >>> +           ret = drm_connector_attach_encoder(connector, encoder);
> >>> +           if (ret) {
> >>> +                   DRM_DEV_ERROR(dev->dev, "failed to attach LVDS connector: %d\n", ret);
> >>> +
> >>> +                   return ret;
> >>> +           }
> >>> +
> >>>             break;
> >>>     case DRM_MODE_ENCODER_TMDS:
> >>>             encoder = mdp4_dtv_encoder_init(dev);
> >
>


-- 
With best wishes
Dmitry
