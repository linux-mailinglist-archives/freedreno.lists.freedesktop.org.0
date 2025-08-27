Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6F9AB38465
	for <lists+freedreno@lfdr.de>; Wed, 27 Aug 2025 16:05:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A860710E119;
	Wed, 27 Aug 2025 14:05:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="H9ALsPMi";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6756C10E112
 for <freedreno@lists.freedesktop.org>; Wed, 27 Aug 2025 14:05:01 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57R6kFxJ014807
 for <freedreno@lists.freedesktop.org>; Wed, 27 Aug 2025 14:05:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=3n2g0Y56LJ8V+gTCm6izqR6c
 NmLrEHV5/R5UXj9u9s4=; b=H9ALsPMiECpSZnQXU2DW4FIqnnpUD94/ULdoZiy0
 qN2lzn8VtL6uoNXZdnR2C+U1A1sUExlCx6MMlJrN4HKN3V6S8a7w07U238xpL4mb
 y1qQ0jXaTUHWT/mm4aT5sztcNM0AQpow3HRi6R2SYZGgKC78TFHp/WYXicXa7BEi
 JciTR8mHsb3HCI0x/eOnk6vF9lBZ16987ABMFpPF3ov4RJlGcgEZ45aO6720q+8o
 YazMiJVLwznoljH6k+S9oQfFgOn1gD/1SFCRjT3up7GVWiVlBP05MBYGx7SONp//
 yKrzgMxsvrKdmDYIT0tbeoaGU6i+Lh5zyKpk+ZsgzPfflg==
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5we4kyh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 27 Aug 2025 14:05:00 +0000 (GMT)
Received: by mail-io1-f69.google.com with SMTP id
 ca18e2360f4ac-886e2a4735aso237466039f.3
 for <freedreno@lists.freedesktop.org>; Wed, 27 Aug 2025 07:05:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756303499; x=1756908299;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3n2g0Y56LJ8V+gTCm6izqR6cNmLrEHV5/R5UXj9u9s4=;
 b=KP18sTYkqyew0JxYf5nMjfhA0vifE/d27hs+CR44abNTczkDiD0r8ZR6BNStyRu7dM
 ds9CJzGAVFZQpKFs10qyi+ODhGrtoBMSeRvU+aSqH2lNkmfR9HL6iRvf1qV27jN2tGFb
 u+6D3dOu2urVS597fRpnrFo+TbIeEBAVZCFjoLZzgiFs313GsOkLuODTmbm5wIjlT/ly
 sS3TesemlcoO/vi0tpjS21ej5cg8S79ewwegP/vWl/YsZWOBrzcRwHgwx/lxYFJwcWv+
 Z5SaEWUu+3MAJGEzv0gTWlBQWk/dW7KdrQjnK/wjCbqmBq5crE8LhWPQ79XhcTd8azmr
 fmGQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUZJXQs362YAq2QM/Rp6mFvNeTwaAp5MupbcMofjXUOry5uOmx4D/tgH7Fn/m7tNXPxzDBBNPjJETU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YylXcVCxjWK/96zFL8uRAPQZPaSxurFjqzC4UDi8MTlkg+4eHia
 xWCrjsp5hMNs9FWM3HLoN0g55Eue2U9DgE2jvkoj/ahIhfNOJ9XnURsQH56puQNPNbKII4fKhxe
 sRblDiSA3oNpC66YWV4WSvHoh+9AgY9qDvE9aKAyMBbvj5RHS72Npc6cAfHtzdzYQM8Dexyw=
X-Gm-Gg: ASbGnctxw5kVZ2eGaoMcAdKAJoPKr5o/Kr1BKB/rUvxX4JoVyi4Js/0bGDQ3Wv5xfNo
 Kr3texxg3rgtBVRKvZKg9NIUo5+2S3Pl8WUlUeJkxAfwOtQXdB0H2Vd1oYQHmbtVKjJ/Wt4xc10
 mF8fXbOdc+KCH/0+VL5uGpiIycqV+C3sZadtPWncZ/LjQ0vwA5Aw01/Sv2EaVwMQ5udEhDt7Mjk
 uYi/RK3CMjRrcN/qdxZhRsfUFJaxfWraBmdPO+/GHvDtAhl4eZcYdeZcFvD+ueOIaaNV7bUqRPW
 63TJXQQXLJcdrD72gTvb3u7bfY7yf7CtugHdCPkggN7fS4ZtbL8w9inB85UbehvEc1stWFGlNVm
 BLtbY4UF+s8o8XL9Lae/nLMk2EXNwm0Febl386cEogt+vQRNoxqrK
X-Received: by 2002:a05:6e02:1b0c:b0:3ef:1b56:c8ea with SMTP id
 e9e14a558f8ab-3ef1b56c9f9mr67415945ab.11.1756303498926; 
 Wed, 27 Aug 2025 07:04:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE/xsdrf+XrjtSQ2K8ar35ewr1T+sNBP+/hCqgRfZjcDR4oY8KJbZTP/1e4Kh/mCkfx80z06g==
X-Received: by 2002:a05:6e02:1b0c:b0:3ef:1b56:c8ea with SMTP id
 e9e14a558f8ab-3ef1b56c9f9mr67415045ab.11.1756303498104; 
 Wed, 27 Aug 2025 07:04:58 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55f35c11ffesm2878362e87.40.2025.08.27.07.04.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Aug 2025 07:04:56 -0700 (PDT)
Date: Wed, 27 Aug 2025 17:04:53 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sandy Huang <hjc@rock-chips.com>,
 Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Liu Ying <victor.liu@nxp.com>, Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH v2 1/8] drm/connector: let drivers declare infoframes as
 unsupported
Message-ID: <jrvjvayhjczgb4yx3xshbv3e6ndzkmb7uu3ynoes2maniwjg37@hamxu5mzqmf7>
References: <20250819-drm-limit-infoframes-v2-0-7595dda24fbd@oss.qualcomm.com>
 <20250819-drm-limit-infoframes-v2-1-7595dda24fbd@oss.qualcomm.com>
 <20250820-artichoke-silkworm-of-election-521b5e@houat>
 <v7w7xkefm6ap7delx7wsvxmc76fwptqhe4ehokzfh4baueb7hr@acrx36exv42v>
 <20250827-adorable-ocelot-of-adventure-ba88b7@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250827-adorable-ocelot-of-adventure-ba88b7@houat>
X-Proofpoint-GUID: 9Wf5ErjOsU1tyMQAjoCRqVPgPmPXB9in
X-Proofpoint-ORIG-GUID: 9Wf5ErjOsU1tyMQAjoCRqVPgPmPXB9in
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfX2VCqZH2hvPTR
 OoZHm00W/RPKbZ4Gw7CSkEyGbRtyMvCBt34JIvGLsnn9EoajS3W938g4I9d+AJy4PLmxPon+FzT
 qVwpWkdHupSMKgfHq06sq4lQpt8xA312zaVYciVr1kyGuxu9dXq03ZI8tEP8pr88qB2LdBXkOxA
 kxyJ46dlNnxZYncvFq9n577gkRrlN/JZUD2WLhSg66mNZw78ptY38ZnIEYsb5ATc2sF0o6lMhLE
 axucG0vDVJAnTQxZnzkpibOOL9LG7NOtEoLtSP2yXl86TttiTcM3blTm9qV9/DgkQFGVivWsopg
 kaONuFBDyBLgHh+9J3luZdeUvwwODLyVStHuD/esHn5a4qO+jRxUiZ8FkJooin5ZQpZ4SJTDhB5
 W7l3H0QG
X-Authority-Analysis: v=2.4 cv=BJazrEQG c=1 sm=1 tr=0 ts=68af108c cx=c_pps
 a=7F85Ct0dzgNClt63SJIU8Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=WI-fMjCVXOxGoBDYoyYA:9 a=CjuIK1q_8ugA:10
 a=LKR0efx6xuerLj5D82wC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-27_03,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 bulkscore=0 phishscore=0 suspectscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508230033
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

On Wed, Aug 27, 2025 at 09:30:20AM +0200, Maxime Ripard wrote:
> Hi,
> 
> On Wed, Aug 20, 2025 at 12:52:44PM +0300, Dmitry Baryshkov wrote:
> > On Wed, Aug 20, 2025 at 09:15:36AM +0200, Maxime Ripard wrote:
> > > Hi,
> > > 
> > > On Tue, Aug 19, 2025 at 09:57:30PM +0300, Dmitry Baryshkov wrote:
> > > > Currently DRM framework expects that the HDMI connector driver supports
> > > > all infoframe types: it generates the data as required and calls into
> > > > the driver to program all of them, letting the driver to soft-fail if
> > > > the infoframe is unsupported. This has a major drawback on userspace
> > > > API: the framework also registers debugfs files for all Infoframe types,
> > > > possibly surprising the users when infoframe is visible in the debugfs
> > > > file, but it is not visible on the wire.
> > > > 
> > > > Let drivers declare that they support only a subset of infoframes,
> > > > creating a more consistent interface.
> > > > 
> > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > > 
> > > I'm not really convinced. Infoframes aren't really something you should
> > > ignore, AVI is effectively mandatory, HDMI kind of is too, AUDIO is if
> > > audio support is enabled, DRM is mandatory if HDR is used.
> > 
> > Nevertheless, sun4i, innohdmi, adv7511, it6263 and rk3066 drivers
> > provide support only for the AVI infoframe.
> 
> Yes, but it's still something we shouldn't paper over. The spec mandates
> it, if drivers want to deviate from it it's something we should warn
> about, not silence.
> 
> sun4i is a good example, to me at least since I have the doc. The
> hardware supports AVI, Audio, ACP, and SPD. HDR isn't supported, so DRM
> isn't either. The only missing one is HDMI, but the documentation isn't
> the best so it might still be supported. In short, it's a driver issue.
> 
> adv7511 supports AVI, Audio, ACP, SPD, ACP, and looks to have a
> mechanism to send any infoframe as is. So, again, driver issue.

I've send a patch, enabling SPD and VSI (HDMI) InfoFrames on ADV7511.

> 
> I couldn't find the other datasheet, but I'd be very surprised if it
> wasn't the case for these too.
> 
> > Some of them can be extended to support other infoframe kinds (e.g.
> > ADV7511 has two spare infoframes which can be used for HDMI and SPD).
> > 
> > > SPD is indeed optional though.
> > > 
> > > So, it's really dynamic in essence, and not really something we should
> > > expect drivers to ignore.
> > > 
> > > I do acknowledge that a lot of drivers just silently ignore the
> > > infoframes they don't support at the moment, which isn't great either.
> > > 
> > > Maybe we should standardize and document what drivers should do when
> > > they don't support a given infoframe type?
> > 
> > The chips might be generating infoframes internally. This series was
> > triggered by LT9611UXC, which does all HDMI work under the hood in the
> > firmware. See [1]. The series I posted hooks HDMI audio directly into
> > the bridge driver, but I'd really prefer to be able to use
> > drm_atomic_helper_connector_hdmi_hotplug(), especially if I ever get to
> > implementing CEC support for it.
> > 
> > ADV7511 likewise generates audio infoframe without Linux
> > help (audio-related fields are programmed, but it's not the
> > infoframe itself).
> 
> Implementing the write_infoframe hooks as a nop with a comment in those
> case is totally reasonable to me.
> 
> I'd still like to document that drivers should only return 0 if they
> programmed the infoframe, and -ENOTSUPP (and the core logging a warning)
> otherwise.
> 
> That way, we would be able to differentiate between the legimitate
> LT9611UXC case, and the "driver is broken" sun4i (and others) case.

I don't want to end up in a sitation where userspace has a different
idea of the InfoFrame being sent than the actual one being present on
the wire. It seems, we need several states per the infoframe:

- Not supported
- Autogenerated
- Generated by software

E.g. in case of ADV7511 we can declare that Audio InfofFrame is
autogenerated, AVI, HDMI and SPD as 'software-generated' and DRM (HDR)
as unsupported. LT9611UXC will declare all (need to check) frame types
as auto.

This way we can implement the checks and still keep userspace from
having irrelevant data in debugfs.

I will update my patchset to implement this, but I have another question
beforehand: should we just declare VSI support or should it be more exact,
specifying that the driver support HVS (00:0c:03), HVFS (c4:5d:d8), etc?

I'm asking, because e.g. MSM HDMI controller has hardware support for
generating HVS frames (but only HVS, the OUI is not programmed, register
format doesn't match 1:1 frame contents, etc). I instead ended up using
GENERIC0, because it was more flexible (it's like SPARE packets on
ADV7511, the contents is being sent as is). However if we ever need to
send DRM infoframes, we might need to switch from GENERIC0 to HVS, for
the price of being unable to send HVFS frames.

WDYT?

-- 
With best wishes
Dmitry
