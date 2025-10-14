Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A7EFBDA8BB
	for <lists+freedreno@lfdr.de>; Tue, 14 Oct 2025 18:02:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2E4F10E654;
	Tue, 14 Oct 2025 16:02:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="D8d+RoYv";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F48F10E654
 for <freedreno@lists.freedesktop.org>; Tue, 14 Oct 2025 16:02:10 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59E87L9w025916
 for <freedreno@lists.freedesktop.org>; Tue, 14 Oct 2025 16:02:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=RIDTlMFsrNFSupa3j2HpAaCj
 j/tHU19+vRKipgxflMY=; b=D8d+RoYv2SKec5D8jKbm7NuvfVXZqqaa/GwmQ6aE
 sUgom710S9UPY91JnZdhu3MV9uSMm7AezppNgUxr0sD0+wKthsX8t/xVCYuuO9HB
 c/ao4tPKCqAN9pH5EkcXtF2/HDyp5mUDgg10c9t/lS45bDxmoVTu6fM9j1gF/3h3
 wgZLO5bjaX3fUvnyvjtLsxeQEyGkgI1seNX8Mv/sq3Di5lY44x4IaY+IXGbpLnUn
 d05SqnZ7V9IPxRJpmkcyFgUPztYt7C3c/wh+CK0fs2c2r6YfaZg60K5bhz5GxMsd
 0JvL1tSl/fTL7+enHjFpn3JGDeFi+43/fL3dB5L4oLLzCg==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com
 [209.85.221.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qgdg10g3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 14 Oct 2025 16:02:09 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id
 71dfb90a1353d-555a199e5dbso42701e0c.1
 for <freedreno@lists.freedesktop.org>; Tue, 14 Oct 2025 09:02:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760457727; x=1761062527;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RIDTlMFsrNFSupa3j2HpAaCjj/tHU19+vRKipgxflMY=;
 b=w3u46NeHyictOIsspLJ2pJpep0WMSl8qujmDCaG8uWB51JwZcgjtXGg0XnGYUrZa9J
 L1UISWmkjVS/pDkVvkvcAnDFkB7c58cUef5v9IDCobDZ2DXMh6gPtjFN3B3Jimp2IssU
 OYGOyZ2kGr2Ypv2I3RuEHLEjw3ch8+VZ9fxFnpqlBc81gV3oO78cho3ELd0jlOhElpop
 Xa18JDBYUW5+qI+5j5d/5ooCt2yl3Wpom4WjiVL5PU4wjElKcD2colpe/QfzPWmBUTBl
 8eSijwmejH8HZYi2ZA/MRsfrDwRGrUPz8FeQ6/kLWuHm7RJqzbEjwCUPFvEXEt0UMyE2
 BGFA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVyYk7s9SGKwwqBpkRVdXh+ZFFnG3zwDqneQo9wpzLB2NTDXgfrHiYKRcRi6PvSmTOy0SBErF9J1q0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxS1dR/6Tba6QNEk9/klZtlBCPBtxea/xHE5jYPjf2qiXxhtFt1
 MGMbssA8L+KGGfPJN3eNhwXqEXYvNr5SiBpqR5uTZ60sskhT4IQ47sM/Ha3ptwZmeM8rB5nFo+/
 /OySUKtPga/9f/TA+TGVeKY8e37XmNAi1NYIoidMgubGG/KByhCNcOpt+0DU87Q9j6OZdoDc=
X-Gm-Gg: ASbGnctrJkiggpz/v+tqXH+avd2e7QBj4/kSXynHtvHJsVyhZNbUAeNJADvyVjc2TJO
 nqhS8UyDUkdFLUUqAiq/5OOGV06BVG4ofXnSYu24ex0ZQV47fmb7NY92ZMoLgZXEkOmvxoM0qk0
 M900zEXnl1pV6WNd/LxmqYFmdAWrIw1/6dwLFb8I/howIDmLAXjyDaCkoRg+tVhTfKRTo4SLCir
 O+Rz4ijGgYGz+ABpGvMrw+gNLknX98zcuZeMnXGnGoZdwroeED2T2Zw2ADJ48cUPhmY3hIrOq7q
 OfHuDpNwMBjjDnwGOC63c8/1fXdRQzIQyCyHV5sntERSRdfph4VLoUJwqODzd5p9qTdi7Xp0AhJ
 f57xh5c2z9W7xJQNrDmotwP+6UA966O/5vtwqK6Yj70Wsd9e9dy5p
X-Received: by 2002:a05:6122:e1db:b0:554:e726:7818 with SMTP id
 71dfb90a1353d-554e726a88bmr2893398e0c.2.1760457727456; 
 Tue, 14 Oct 2025 09:02:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGiPVWLHJ62y1HXmozGHeu5tMGTb4MD+todBa4lunYFYoGko1Yp2FhdNfFEHzjjvK5KiwAUsg==
X-Received: by 2002:a05:6122:e1db:b0:554:e726:7818 with SMTP id
 71dfb90a1353d-554e726a88bmr2893311e0c.2.1760457726794; 
 Tue, 14 Oct 2025 09:02:06 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-591c8779e8dsm60095e87.10.2025.10.14.09.02.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Oct 2025 09:02:05 -0700 (PDT)
Date: Tue, 14 Oct 2025 19:02:03 +0300
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
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Daniel Stone <daniels@collabora.com>
Subject: Re: [PATCH v4 01/10] drm/connector: let drivers declare infoframes
 as unsupported
Message-ID: <ez6y7q4lgbwt7kpnlpausjpznckr3yyejrwtxm7o6qw6wlhqoj@6iypzdhfthzy>
References: <20250909-drm-limit-infoframes-v4-0-53fd0a65a4a2@oss.qualcomm.com>
 <20250909-drm-limit-infoframes-v4-1-53fd0a65a4a2@oss.qualcomm.com>
 <20250910-furry-singing-axolotl-9aceac@houat>
 <z333ysst5ifakomo35jtbpydj44epqwwn4da76rcnsq4are62m@32gsmgx2pcdi>
 <20250925-didactic-spiked-lobster-fefabe@penduick>
 <jfxtcvh4l5kzyv74llmzz3bbt6m4mhzhhwl6lh5kfeqgqhkrhi@jzfvtxpedmyf>
 <20251003-primitive-sepia-griffin-cfca55@houat>
 <54a06852-4897-4dae-ab9c-330d99f3bf42@oss.qualcomm.com>
 <5cc5l2dihgdbgnwyugelwrklpaiiy5yaczqllu4bi6asvlt354@kib3flskh34g>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5cc5l2dihgdbgnwyugelwrklpaiiy5yaczqllu4bi6asvlt354@kib3flskh34g>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyNSBTYWx0ZWRfX0KDqcP7hmMjy
 d+Gb6E/QVVJ8c+r5lxsFmNFof2WMsSi6Ij/+jqMjOcCstP+ZZi8/L9Wl4bAoetcUogwTPiWmiYW
 A9qahlyZQPzxaPjSTwjEiGGkuWBYIzWUitFJXKhdD+XTcPZhovkERSgxNW5oQch7ZQ0MEbgrPNp
 W0BEChxFXMCCZadRK/y1cyugqBhfYQchmvsFajbjki1tVk6QooAj7d2OOpX598L3WxtX/UmE1r/
 an5hgQxdh5pvNgPKrrQa32rPEzhBVfvNPfwnTqRzziErQKnSaLTVdZKInKJv0CDCmX1old42oUS
 oI+Osc54RWGZ0xyir/ejuDQS1x+lYc43CneRjYJLi3JdMQXalbfqBAKmotfhDl8RO47QtrC+ePz
 vo+dBElVWrBqN0v5BpoufbOlEySsXw==
X-Proofpoint-GUID: pJyw5RrUj1nVQBnJYXXryeCVZQX8aVyL
X-Proofpoint-ORIG-GUID: pJyw5RrUj1nVQBnJYXXryeCVZQX8aVyL
X-Authority-Analysis: v=2.4 cv=J4ynLQnS c=1 sm=1 tr=0 ts=68ee7401 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=6RWEyACVIll58Qch3D4A:9
 a=CjuIK1q_8ugA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 bulkscore=0 suspectscore=0 clxscore=1015 phishscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110025
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

On Tue, Oct 14, 2025 at 02:43:58PM +0200, Maxime Ripard wrote:
> On Fri, Oct 03, 2025 at 06:41:58PM +0300, Dmitry Baryshkov wrote:
> > On 03/10/2025 17:23, Maxime Ripard wrote:
> > > On Thu, Sep 25, 2025 at 05:55:06PM +0300, Dmitry Baryshkov wrote:
> > > > > > As we will be getting more and more features, some of the InfoFrames
> > > > > > or data packets will be 'good to have, but not required'.
> > > > > 
> > > > > And drivers would be free to ignore those.
> > > > > 
> > > > > > > So, no, sorry. That's still a no for me. Please stop sending that patch
> > > > > > 
> > > > > > Oops :-)
> > > > > > 
> > > > > > > unless we have a discussion about it and you convince me that it's
> > > > > > > actually something that we'd need.
> > > > > > 
> > > > > > My main concern is that the drivers should not opt-out of the features.
> > > > > > E.g. if we start supporting ISRC packets or MPEG or NTSC VBI InfoFrames
> > > > > > (yes, stupid examples), it should not be required to go through all the
> > > > > > drivers, making sure that they disable those. Instead the DRM framework
> > > > > > should be able to make decisions like:
> > > > > > 
> > > > > > - The driver supports SPD and the VSDB defines SPD, enable this
> > > > > >    InfoFrame (BTW, this needs to be done anyway, we should not be sending
> > > > > >    SPD if it's not defined in VSDB, if I read it correctly).
> > > > > > 
> > > > > > - The driver hints that the pixel data has only 10 meaninful bits of
> > > > > >    data per component (e.g. out of 12 for DeepColor 36), the Sink has
> > > > > >    HF-VSDB, send HF-VSIF.
> > > > > > 
> > > > > > - The driver has enabled 3D stereo mode, but it doesn't declare support
> > > > > >    for HF-VSIF. Send only H14b-VSIF.
> > > > > > 
> > > > > > Similarly (no, I don't have these on my TODO list, these are just
> > > > > > examples):
> > > > > > - The driver defines support for NTSC VBI, register a VBI device.
> > > > > > 
> > > > > > - The driver defines support for ISRC packets, register ISRC-related
> > > > > >    properties.
> > > > > > 
> > > > > > - The driver defines support for MPEG Source InfoFrame, provide a way
> > > > > >    for media players to report frame type and bit rate.
> > > > > > 
> > > > > > - The driver provides limited support for Extended HDR DM InfoFrames,
> > > > > >    select the correct frame type according to driver capabilities.
> > > > > > 
> > > > > > Without the 'supported' information we should change atomic_check()
> > > > > > functions to set infoframe->set to false for all unsupported InfoFrames
> > > > > > _and_ go through all the drivers again each time we add support for a
> > > > > > feature (e.g. after adding HF-VSIF support).
> > > > > 
> > > > >  From what you described here, I think we share a similar goal and have
> > > > > somewhat similar concerns (thanks, btw, it wasn't obvious to me before),
> > > > > we just disagree on the trade-offs and ideal solution :)
> > > > > 
> > > > > I agree that we need to sanity check the drivers, and I don't want to go
> > > > > back to the situation we had before where drivers could just ignore
> > > > > infoframes and take the easy way out.
> > > > > 
> > > > > It should be hard, and easy to catch during review.
> > > > > 
> > > > > I don't think bitflag are a solution because, to me, it kind of fails
> > > > > both.
> > > > > 
> > > > > What if, just like the debugfs discussion, we split write_infoframe into
> > > > > write_avi_infoframe (mandatory), write_spd_infoframe (optional),
> > > > > write_audio_infoframe (checked by drm_connector_hdmi_audio_init?) and
> > > > > write_hdr_infoframe (checked in drmm_connector_hdmi_init if max_bpc > 8)
> > > > > 
> > > > > How does that sound?
> > > > 
> > > > I'd say, I really like the single function to be called for writing the
> > > > infoframes. It makes it much harder for drivers to misbehave or to skip
> > > > something.
> > > 
> > >  From a driver PoV, I believe we should still have that single function
> > > indeed. It would be drm_atomic_helper_connector_hdmi_update_infoframes's
> > > job to fan out and call the multiple callbacks, not the drivers.
> > 
> > I like this idea, however it stops at the drm_bridge_connector abstraction.
> > The only way to handle this I can foresee is to make individual bridges
> > provide struct drm_connector_hdmi_funcs implementation (which I'm fine with)
> > and store void *data or struct drm_bridge *hdmi_bridge somewhere inside
> > struct drm_connector_hdmi in order to let bridge drivers find their data.
> 
> Does it change anything? The last HDMI bridge should implement all the
> infoframes it supports. I don't think we should take care of one bridge
> with one infoframe type and some other with another?

Note: I wrote about the _data_. So far the connector's write_infoframe /
clear_infoframe callbacks get drm_connector as an arg. The fact that
there is a drm_bridge which implements a callback is hidden well inside
drm_bridge_connector (and only it knows the bridge_hdmi pointer).
Otherwise, the bridge, trying to implement drm_connector_hdmi_funcs has
no way to go from drm_connector to drm_bridge.

The only possible solution would be to introduce something like
drm_connector_hdmi::data (either void* or drm_bridge*) and use it
internally. But for me this looks like a bit loose abstraction. Though,
if it looks good from your POV, I agree, it would solve enough of
issues.

-- 
With best wishes
Dmitry
