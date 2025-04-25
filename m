Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2D6BA9D503
	for <lists+freedreno@lfdr.de>; Sat, 26 Apr 2025 00:06:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 769B610E9D7;
	Fri, 25 Apr 2025 22:06:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="MLdIKN2E";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 475CA10E9D8
 for <freedreno@lists.freedesktop.org>; Fri, 25 Apr 2025 22:06:00 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGJxUH032119
 for <freedreno@lists.freedesktop.org>; Fri, 25 Apr 2025 22:05:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=gA4yp+/b90fSn6clFQZZzifa
 lY2iHyX9v6vgtAPGerI=; b=MLdIKN2EXvsOizn/XCkfURZkl9QDLDeoiSS2c9Wa
 p8x+X/W6c8gyUcZQwL4T69yD3jIrHIwB61h+dMjMqQM/1g1oJm67bGzhGogiQHAl
 +1JpkT+1TI9EilEG6o+WDBcFNEJlRN8I+03yW+AqXyK5m7DwxQsTBKaO/1BZBF5J
 SZeLHDoTtOD3IZZ5aXz3LZMUPtzveFbx51z1S9RkLryZ9jIFmahp8Fwbh/uad5j/
 ek02fMFL6rcLOLHDgWMKZF0fxIkmqhcg6EseaA6oLALSrigLmD4eWc/9WE38E6xJ
 gGsIq0ZQ98A4F/1rPt2uA16ibEG7s7lMXKuhEouakcGQIA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh1a8m1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 25 Apr 2025 22:05:59 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7c54e7922a1so570839585a.2
 for <freedreno@lists.freedesktop.org>; Fri, 25 Apr 2025 15:05:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745618739; x=1746223539;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gA4yp+/b90fSn6clFQZZzifalY2iHyX9v6vgtAPGerI=;
 b=vkzOU+wREHf46N3Ml34+1awNTfi39DOL9iMB1m6B3v24dSw4H67b7D7jrAzW+xjeuV
 43sekaTuVnpk1yQyEOcmxy+Ku+ca5aEDQvLUN86/MX5VXGn6zSqVtAjtTWHtOJkrzwKY
 aFB22DqMWgOwP/0G3vtv/FztlgUGxqSI/X+8kH627aRDrgj2FaIaH3PEqiX6sLZWQlbM
 COc/xBkuZlaB/7r46fMPgwg7YVyXlmvAAXks23tziWl7/l0mDP32iJ/3UEOxDScwJDHa
 l/STPnKaHnhU9xEmQVkLY8KuXXuWt8ytLKcbACXq2Swb+D+Z9d58sAbtHOYGwT65/coq
 DU4Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWamlXcbPZFu8IbD6IFLyFd50wyIUyph1YlofBUL40h7toOQdQPpGVwrG7DF5tg4KZwi4V6Lk2zJi4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YziVZzyAaDefwh2i8gaE0OxZeuWE5xv8Lf2J06sHp353pWVPAyX
 OX0cQx+p++6qMFZVozgz7fRsKHcCwONORjToS9gapH3ZIec/LAzazLx8vKnfD0cFA1HNh1Qvdco
 syIjFqzu/n1LvbUQB0W/+CeTfD9qrHh2iufcaijXk6+EyqAOBebS9afEbZmYiu1i17xE=
X-Gm-Gg: ASbGncvr7AOTM46dF7kNbHtOXsNp9Qi5dRPNO8UeqFbNfdWsu8sPzeeoUitOfJPHM5d
 U/OtcscyhTaAIIeOz7jSJOaiuqsQuL7Z6zu8eeCRwXF6AyvtBclA9nr6pLOjPoX6NSe4vFL5g06
 Wfv7uO8YB+8PbRt7whRTL0HQF4hf+tfBasninEFNW4i1Xr/ttmQzhsWBtdkJktl9gP363vuAIIx
 TfRDP4ihB16kZqWz9bnCAywxfa5AAiUUM8LG2S10ouzffecsn6i5aGYuQwQut9fkD4KArjguPLM
 XgXLswqE2zNFnoGWGrTvA0ZKSFD4RfjpbuzxUE0HDmzBkDtpBJ2DvEYnRqhY3Ggv7ezrU51FDfQ
 =
X-Received: by 2002:a05:620a:439b:b0:7c7:b60f:ebd8 with SMTP id
 af79cd13be357-7c9668711bdmr231391285a.24.1745618738737; 
 Fri, 25 Apr 2025 15:05:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHdgrN7WJlVehxgxhc3ZH7Rkg3DTR6wldgq1l7nBjGdY6u4B1QzquINtludebsBQfjLm/Hh9w==
X-Received: by 2002:a05:620a:439b:b0:7c7:b60f:ebd8 with SMTP id
 af79cd13be357-7c9668711bdmr231384585a.24.1745618738270; 
 Fri, 25 Apr 2025 15:05:38 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54e816ed359sm590061e87.146.2025.04.25.15.05.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Apr 2025 15:05:37 -0700 (PDT)
Date: Sat, 26 Apr 2025 01:05:34 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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
Subject: Re: [PATCH v3 6/7] drm/msm/mdp4: switch LVDS to use
 drm_bridge/_connector
Message-ID: <sze7kbefltaduma5x2ch2zmz7lvrcsddjdbehjjh66y2xoodem@cky22gnkqvxe>
References: <20250227-fd-mdp4-lvds-v3-0-c983788987ae@linaro.org>
 <20250227-fd-mdp4-lvds-v3-6-c983788987ae@linaro.org>
 <63e5ddf6-151a-42aa-b2cf-003d91b34a04@quicinc.com>
 <s63lvzn35d7xcvw3kkmtasyinxbqa35juyxosdscfk6vhty4pw@hu3dotyklo3r>
 <402bbda7-33c6-49b2-89c7-37372cc07457@quicinc.com>
 <CAO9ioeXhjrOyKz3N3oU6QxW+u6WUC4R5XXqWgb=7iF7Hk0Q_nQ@mail.gmail.com>
 <99e0d2b9-d866-4b52-bde8-a6d89f35aadd@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <99e0d2b9-d866-4b52-bde8-a6d89f35aadd@quicinc.com>
X-Proofpoint-GUID: ii2g6QLJECM5KR6nrbk1IUwKds0Gik8V
X-Authority-Analysis: v=2.4 cv=OY6YDgTY c=1 sm=1 tr=0 ts=680c0747 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8
 a=EXU9CONyTfQLJbyJyrsA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: ii2g6QLJECM5KR6nrbk1IUwKds0Gik8V
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDE2MCBTYWx0ZWRfXycazRs3ttl5a
 wsmUBHgj24EaOye03CEN+SYyQsuxK1s/ypUA8fT88Yx4UoKkNKO2hAwNtELflz28OFocgXK+zJE
 m2AIht0XYrM78pKwdZ4Ilii2suHIrvIxOsugNovaPPfxwOq1X6gs2sgcSOWupsTd1fpcFeGXx+h
 o54PGZe9ljiYKxicD3jt0FBmT3DzHq731xI7CoLKAq+lrr4Rh2SiZmgBAgvqIZBoAh5spwVxxTL
 yUh0OarTGEPfULCPlgd1R23ffg/FQimUUxVjOfoaZkxfaWwxEwqVpWuDdN1XL3TxURMiPE1P224
 /KF/zRl8l1Ji+uyXPJaWr27AenWv0vubADeuslRKLG2yS/F0gq7mW64pGnoPqzCeTQpm4EI7cAd
 uCznjwk3tndOEHSaYCq9JQFo61cj0eaNsQnXbPzMLdfRDGNU+uQjR3jT/dPeFQLJihtZIoeI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_07,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 lowpriorityscore=0 suspectscore=0 mlxscore=0 clxscore=1015 malwarescore=0
 mlxlogscore=999 phishscore=0 priorityscore=1501 spamscore=0 adultscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250160
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

On Fri, Apr 25, 2025 at 01:01:10PM -0700, Abhinav Kumar wrote:
> 
> 
> On 4/25/2025 2:27 AM, Dmitry Baryshkov wrote:
> > On Fri, 25 Apr 2025 at 00:00, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> > > 
> > > 
> > > 
> > > On 4/24/2025 3:23 AM, Dmitry Baryshkov wrote:
> > > > On Wed, Apr 23, 2025 at 07:04:16PM -0700, Abhinav Kumar wrote:
> > > > > 
> > > > > 
> > > > > On 2/26/2025 6:25 PM, Dmitry Baryshkov wrote:
> > > > > > LVDS support in MDP4 driver makes use of drm_connector directly. However
> > > > > > LCDC encoder and LVDS connector are wrappers around drm_panel. Switch
> > > > > > them to use drm_panel_bridge/drm_bridge_connector. This allows using
> > > > > > standard interface for the drm_panel and also inserting additional
> > > > > > bridges between encoder and panel.
> > > > > > 
> > > > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > > > ---
> > > > > >     drivers/gpu/drm/msm/Makefile                       |   1 -
> > > > > >     drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c           |  34 +++++--
> > > > > >     drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h           |   6 +-
> > > > > >     drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c  |  20 +----
> > > > > >     .../gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c    | 100 ---------------------
> > > > > >     5 files changed, 28 insertions(+), 133 deletions(-)
> > > > > > 
> > > > > > @@ -199,27 +201,43 @@ static int mdp4_modeset_init_intf(struct mdp4_kms *mdp4_kms,
> > > > > >               * bail out early if there is no panel node (no need to
> > > > > >               * initialize LCDC encoder and LVDS connector)
> > > > > >               */
> > > > > > -           panel_node = of_graph_get_remote_node(dev->dev->of_node, 0, 0);
> > > > > > -           if (!panel_node)
> > > > > > -                   return 0;
> > > > > > +           next_bridge = devm_drm_of_get_bridge(dev->dev, dev->dev->of_node, 0, 0);
> > > > > > +           if (IS_ERR(next_bridge)) {
> > > > > > +                   ret = PTR_ERR(next_bridge);
> > > > > > +                   if (ret == -ENODEV)
> > > > > > +                           return 0;
> > > > > > +                   return ret;
> > > > > > +           }
> > > > > > -           encoder = mdp4_lcdc_encoder_init(dev, panel_node);
> > > > > > +           encoder = mdp4_lcdc_encoder_init(dev);
> > > > > >              if (IS_ERR(encoder)) {
> > > > > >                      DRM_DEV_ERROR(dev->dev, "failed to construct LCDC encoder\n");
> > > > > > -                   of_node_put(panel_node);
> > > > > >                      return PTR_ERR(encoder);
> > > > > >              }
> > > > > >              /* LCDC can be hooked to DMA_P (TODO: Add DMA_S later?) */
> > > > > >              encoder->possible_crtcs = 1 << DMA_P;
> > > > > > -           connector = mdp4_lvds_connector_init(dev, panel_node, encoder);
> > > > > > +           ret = drm_bridge_attach(encoder, next_bridge, NULL, DRM_BRIDGE_ATTACH_NO_CONNECTOR);
> > > > > > +           if (ret) {
> > > > > > +                   DRM_DEV_ERROR(dev->dev, "failed to attach LVDS panel/bridge: %d\n", ret);
> > > > > > +
> > > > > > +                   return ret;
> > > > > > +           }
> > > > > 
> > > > > Can you pls point me to the lvds bridge used with this apq8064 board? I was
> > > > > unable to find it. Just wanted to compare that against this while reviewing.
> > > > 
> > > > It's the panel bridge, wrapping one of the LVDS panels.
> > > > 
> > > 
> > > Yes but what I wanted to check was which LVDS panel was being used so
> > > far. Looks like for arm32 the dts is missing? As I couldnt find the lvds
> > > out endpoint. So can you pls point me to the lvds panel you verified
> > > this with?
> > 
> > I used the AUO b101xtn01 panel connected to the LVDS connector on the
> > IFC6410. I'm not posting DT bits since the panel is not a part of the
> > kit.
> > 
> 
> Ok, so at this point of time, this is just the driver piece which does not
> have a real HW in the tree to be verified with.

More or less so. Srini tried to push the panel in 2015 ([1]). PR was
rejected and then nobody ever implemented EDID-based selection for LVDS
panels. I simply soldered the LVDS cable and used more or less the same
patch (I can post it separately if necessary). To verify the pipeline
you can use any LVDS panel defined in the DT, it should be enough to
verify it.

[1] https://lore.kernel.org/linux-arm-msm/1438088076-17606-1-git-send-email-srinivas.kandagatla@linaro.org/

> 
> 
> > > 
> > > 
> > > > > > +
> > > > > > +           connector = drm_bridge_connector_init(dev, encoder);
> > > > > >              if (IS_ERR(connector)) {
> > > > > >                      DRM_DEV_ERROR(dev->dev, "failed to initialize LVDS connector\n");
> > > > > > -                   of_node_put(panel_node);
> > > > > >                      return PTR_ERR(connector);
> > > > > >              }
> > > > > > +           ret = drm_connector_attach_encoder(connector, encoder);
> > > > > > +           if (ret) {
> > > > > > +                   DRM_DEV_ERROR(dev->dev, "failed to attach LVDS connector: %d\n", ret);
> > > > > > +
> > > > > > +                   return ret;
> > > > > > +           }
> > > > > > +
> > > > > >              break;
> > > > > >      case DRM_MODE_ENCODER_TMDS:
> > > > > >              encoder = mdp4_dtv_encoder_init(dev);
> > > > 
> > > 
> > 
> > 
> 

-- 
With best wishes
Dmitry
