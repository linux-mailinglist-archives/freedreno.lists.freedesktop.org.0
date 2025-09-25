Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF51BBA016B
	for <lists+freedreno@lfdr.de>; Thu, 25 Sep 2025 16:55:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6B1910E95E;
	Thu, 25 Sep 2025 14:55:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="SMkLq9We";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 867E010E95E
 for <freedreno@lists.freedesktop.org>; Thu, 25 Sep 2025 14:55:12 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P9k8j6025084
 for <freedreno@lists.freedesktop.org>; Thu, 25 Sep 2025 14:55:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 UCKLHPclZ92VqQVzO2ihLAAMvehhf/ZUsH5t+sSqD3E=; b=SMkLq9Wewvn6bGnz
 U6J7wYFE1wJkqpjahkh1SHMxuKKtZ/CX0Um8belckqxAZWqAiF3rrkmvbE3uzYYx
 4ZFsp3seTfAf6Vhz2DeIXiAA5j7kehb06ztPgyixJyk3J61J2ZtBELgE3zrBIV1B
 +BwHNiJscVYUc0aWDDmlVzdnT/I7WeNvcb9MbBxbG6+oWbk5z8gq1XPyGSsbiw5J
 GjvheJ9P4XTtsk4TqAdu0uzJG/rBGjkfB+3qovsYXU/np0EidbIgU3IqRbpmaWrA
 oc1g0MRUlchQSjOwmn8SsjQZk5WDZg50wlJhQaWDvwFpYhnLJFTJ9FjSXkD8BsZy
 TZ0azQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499hyf0tuy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 25 Sep 2025 14:55:11 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4b5ecf597acso24184021cf.1
 for <freedreno@lists.freedesktop.org>; Thu, 25 Sep 2025 07:55:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758812110; x=1759416910;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UCKLHPclZ92VqQVzO2ihLAAMvehhf/ZUsH5t+sSqD3E=;
 b=MiWxj2Mgpfi1WXDQkn7JFN0b/uiDdsvARMjDiSEmK5Id4azByRsKbdcYPk2socnShv
 NK8YIizCUVTZpE/qcitJOnHuQdGFPUrk4f4USYqzJCciGzVJF00LE6nE8mwiGBDqD1zI
 NL41GflpLU8JzqlxzoNJIZZ4JgBnGH1zpNRd7XmClMxajdkTAzLkUDF46sb4xagHzZ5o
 BKtl61Jm+enEcqkfpUevLNsI5DY/81HHPjYe8X0SxMPTpnhnnUdfZ/xviiCvTIfxyibB
 kb1HfHioY00wq+rlIQSTZSlIeI1Xb3nQAHr8xvETiKHqpwGIrgj5LWL1ypvmibMjnH83
 4d7A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUeCj7rQKzu3Z3xpZISx8PkAj9BIyV+B9CWc1ozasmB53ZhayeLl7c4fpDu78uD41ZzMeY6Y8en8Qg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy+FlbCio8p+0OoGZRT7R40VWZe152WyCUm71DS6tQzXMWHVG21
 vPj38KFIlrUTOrZ1bJll+hFRJt4kyuXIIVhNU3nmLpKTfVJVKD/1XgWz/NGzkJCvZMC5P4wKlEF
 ztRFKqC9LpIk4EtqTcl4AoNaMIyGFWLLHddnOdXRh6CNQQnRAfSP5l3cLmht0AnnciKoDSvM=
X-Gm-Gg: ASbGnctl4mnCg0sHs6Azr12CBQyWclrpmLDt9LTCFy1WVYj8YdL3N1Gk+dNiIhFwlqm
 YzS1HVlkAHoDJLMbEz6WOaYozYQ4cM3xDsyDryL2J1ylL8qpxe8poEAdAVBggnFR/e7dc1Kljeh
 HOQiITFvNwymbOkVR3HovpF93FlL+9oUXd2W8/DLGnVdAnclvYCOdyBs2AccFFiEEx1osFqJIQU
 k9lsT5gd7pcmXQJk7LsGpcmxPyxFhsz3l1UqzsrR7y4v0Lnd54ca4FO6tf+ulhyj4pDPp4XgfHv
 78yjrBpOZv5aqD9JHsUfzZshh2o6ORNu/5zIZ0JdTYnR+BIYcR3XLPDf2M6TGpaRfPuvNi4jWWU
 G9ihsX0stb5KlOMmm2eV6LsWv53vc4oHEAVbruh7YJ8ROLJOwtA/X
X-Received: by 2002:a05:622a:2c4:b0:4ca:d221:7f47 with SMTP id
 d75a77b69052e-4da481d5671mr49733701cf.20.1758812109986; 
 Thu, 25 Sep 2025 07:55:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGZICDfrSZTRJ2GaxTMZc5seKL08CVV0TR7RmaHg0ybBZh1gfpRHIOxkw8Z+UaKEDm6GC1Ahw==
X-Received: by 2002:a05:622a:2c4:b0:4ca:d221:7f47 with SMTP id
 d75a77b69052e-4da481d5671mr49732751cf.20.1758812109007; 
 Thu, 25 Sep 2025 07:55:09 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-58313fc02c1sm853387e87.60.2025.09.25.07.55.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Sep 2025 07:55:08 -0700 (PDT)
Date: Thu, 25 Sep 2025 17:55:06 +0300
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
Message-ID: <jfxtcvh4l5kzyv74llmzz3bbt6m4mhzhhwl6lh5kfeqgqhkrhi@jzfvtxpedmyf>
References: <20250909-drm-limit-infoframes-v4-0-53fd0a65a4a2@oss.qualcomm.com>
 <20250909-drm-limit-infoframes-v4-1-53fd0a65a4a2@oss.qualcomm.com>
 <20250910-furry-singing-axolotl-9aceac@houat>
 <z333ysst5ifakomo35jtbpydj44epqwwn4da76rcnsq4are62m@32gsmgx2pcdi>
 <20250925-didactic-spiked-lobster-fefabe@penduick>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250925-didactic-spiked-lobster-fefabe@penduick>
X-Proofpoint-GUID: XX1Qt0Eso3bBeLPCcBhwD9KqvPJRlpzX
X-Authority-Analysis: v=2.4 cv=YMOfyQGx c=1 sm=1 tr=0 ts=68d557cf cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=8AirrxEcAAAA:8 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8
 a=jixIfWMKhexVEAdDGxYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=ST-jHhOKWsTCqRlWije3:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAwNCBTYWx0ZWRfXxD4zqK2CUBuC
 W5CQp0qsteFcDmNB7RnKPmYX4AkO/KNy629K2+i44lyAwQ9OwhocdmJa0SyJnYkoMaqXs6xGnNg
 0KMikpwnlwCl7vQNw2FRuu76EOlYgUmlyb0magJM3EKYWQK6+D+S8WdkVMoAuMFCUNv4AovO+B0
 NeCeRub0lRySPzu/wlm01W4HwkLjRCkT+I85nvKxoKppnkeymf/hlBqGRr2Vn0RFLsJuB882TIL
 /AYWfB/WQUEUq+wnYzy1nXUZKHn1vqoc8lh+VTfZdHhMhDX4XNoQ0yYr14VMvwbyv+DPVXimqRH
 j3OegiYbVOKltqk7ndENYcDDHx4+sXKJWWsijEFIKtBERhMPs7bXewoMwCfZp2Cv5smRXrw0vo3
 lE6lFAWf
X-Proofpoint-ORIG-GUID: XX1Qt0Eso3bBeLPCcBhwD9KqvPJRlpzX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-25_01,2025-09-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 suspectscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200004
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

On Thu, Sep 25, 2025 at 02:36:46PM +0200, Maxime Ripard wrote:
> On Wed, Sep 10, 2025 at 06:16:25PM +0300, Dmitry Baryshkov wrote:
> > On Wed, Sep 10, 2025 at 01:03:47PM +0200, Maxime Ripard wrote:
> > > On Tue, Sep 09, 2025 at 05:51:59PM +0300, Dmitry Baryshkov wrote:
> > > > Currently DRM framework expects that the HDMI connector driver supports
> > > > all infoframe types: it generates the data as required and calls into
> > > > the driver to program all of them, letting the driver to soft-fail if
> > > > the infoframe is unsupported. This has a major drawback on userspace
> > > > API: the framework also registers debugfs files for all Infoframe types,
> > > > possibly surprising the users when infoframe is visible in the debugfs
> > > > file, but it is not visible on the wire. Drivers are also expected to
> > > > return success even for unsuppoted InfoFrame types.
> > > > 
> > > > Let drivers declare that they support only a subset of infoframes,
> > > > creating a more consistent interface. Make the affected drivers return
> > > > -EOPNOTSUPP if they are asked to program (or clear) InfoFrames which are
> > > > not supported.
> > > > 
> > > > Acked-by: Liu Ying <victor.liu@nxp.com>
> > > > Acked-by: Daniel Stone <daniels@collabora.com>
> > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > > 
> > > Again, I still believe that it's a bad idea, goes against what the spec
> > > states, and the framework was meant to be.
> > 
> > Please correct me if I'm wrong. The specs (HDMI & CEA) define several
> > infoframes and whether we should be sending them. If I'm reading it
> > correctrly, CEA spec explicitly says 'If the Source supports the
> > transmission of [foo] InfoFrame..." (6.4 - AVI, 6.6 - Audio, 6.7 MPEG,
> > 6.9 - DRM). For other InfoFrames (6.5 SPD, 6.8 NTSC VBI) it just defines
> > that sending those frames is optional.
> 
> SPD is indeed optional, but the HDMI spec, (HDMI 1.4b, Section 8.2.1 -
> Auxiliary Video information (AVI) InfoFrame) states that:
> 
>   A Source shall always transmit an AVI InfoFrame at least once per two
>   Video Fields if the Source:
> 
>    * is ever capable of transmitting an AVI InfoFrame or,
>    * is ever capable of transmitting YCBCR pixel encoding or,
>    * is ever capable of transmitting any colorimetry other than the
>      transmitted video format’s default colorimetry or,
>    * is ever capable of transmitting any xvYCC or future enhanced
>      colorimetry or,
>    * is ever capable of transmitting any Gamut Metadata packet or,
>    * is ever capable of transmitting any video format with multiple
>      allowed pixel repetitions or,
>    * is ever capable of transmitting Content Type other than “no data” or,
>    * is ever capable of transmitting YCC Quantization Range.
> 
>   The AVI InfoFrame shall be transmitted even while such a Source is
>   transmitting RGB and non-pixel-repeated video. When a Source is not
>   explicitly required to transmit AVI InfoFrames, it is recommended that
>   the Source transmit AVI InfoFrames.
> 
> So it's recommended in every case, and the list kind of makes it
> mandatory for how Linux uses HDMI.

Agreed.

> 
> Also, did we ever encounter some hardware that couldn't send AVI?

No.

> 
> Audio is mandatory when streaming audio, DRM when using HDR, and we
> don't support the others yet.
> 
> So the only we support but don't have to send is SPD.
> 
> > We can't even infer support for InfoFrames from the Source features.
> > E.g. CEA 6.6.1 defines a case when digital audio is allowed to be sent,
> > without sending Audio InfoFrame.
> 
> HDMI 1.4 section 8.2.2 - Audio Infoframe states that:
> 
>   Whenever an active audio stream is being transmitted, an accurate
>   Audio InfoFrame shall be transmitted at least once per two Video
>   Fields.
> 
> I'd say it takes precedence over CTA-861.

I see, I was referring to CTA indeed. HDMI takes precedence.

> 
> > As we will be getting more and more features, some of the InfoFrames
> > or data packets will be 'good to have, but not required'.
> 
> And drivers would be free to ignore those.
> 
> > > So, no, sorry. That's still a no for me. Please stop sending that patch
> > 
> > Oops :-)
> > 
> > > unless we have a discussion about it and you convince me that it's
> > > actually something that we'd need.
> > 
> > My main concern is that the drivers should not opt-out of the features.
> > E.g. if we start supporting ISRC packets or MPEG or NTSC VBI InfoFrames
> > (yes, stupid examples), it should not be required to go through all the
> > drivers, making sure that they disable those. Instead the DRM framework
> > should be able to make decisions like:
> > 
> > - The driver supports SPD and the VSDB defines SPD, enable this
> >   InfoFrame (BTW, this needs to be done anyway, we should not be sending
> >   SPD if it's not defined in VSDB, if I read it correctly).
> > 
> > - The driver hints that the pixel data has only 10 meaninful bits of
> >   data per component (e.g. out of 12 for DeepColor 36), the Sink has
> >   HF-VSDB, send HF-VSIF.
> > 
> > - The driver has enabled 3D stereo mode, but it doesn't declare support
> >   for HF-VSIF. Send only H14b-VSIF.
> > 
> > Similarly (no, I don't have these on my TODO list, these are just
> > examples):
> > - The driver defines support for NTSC VBI, register a VBI device.
> > 
> > - The driver defines support for ISRC packets, register ISRC-related
> >   properties.
> > 
> > - The driver defines support for MPEG Source InfoFrame, provide a way
> >   for media players to report frame type and bit rate.
> > 
> > - The driver provides limited support for Extended HDR DM InfoFrames,
> >   select the correct frame type according to driver capabilities.
> > 
> > Without the 'supported' information we should change atomic_check()
> > functions to set infoframe->set to false for all unsupported InfoFrames
> > _and_ go through all the drivers again each time we add support for a
> > feature (e.g. after adding HF-VSIF support).
> 
> From what you described here, I think we share a similar goal and have
> somewhat similar concerns (thanks, btw, it wasn't obvious to me before),
> we just disagree on the trade-offs and ideal solution :)
> 
> I agree that we need to sanity check the drivers, and I don't want to go
> back to the situation we had before where drivers could just ignore
> infoframes and take the easy way out.
> 
> It should be hard, and easy to catch during review.
> 
> I don't think bitflag are a solution because, to me, it kind of fails
> both.
> 
> What if, just like the debugfs discussion, we split write_infoframe into
> write_avi_infoframe (mandatory), write_spd_infoframe (optional),
> write_audio_infoframe (checked by drm_connector_hdmi_audio_init?) and
> write_hdr_infoframe (checked in drmm_connector_hdmi_init if max_bpc > 8)
> 
> How does that sound?

I'd say, I really like the single function to be called for writing the
infoframes. It makes it much harder for drivers to misbehave or to skip
something.

Following this discussion, let's take smaller steps: modify the drivers
to disable unsupported infoframes in atomic_check() and return an error
from write/clear_infoframe if the type is unuspported. Then I'd probably
like to correct SPD handling, only sending it if it is supported by the
Sink. I still think in the end we should have the bitmask for
truly-optional packets and InfoFrames, but having only SPD doesn't
provide enough pressure. I'd just leave the FIXME and let somebody
working on those features to implement that. I am tempted to implement
ISRC support just for the sake of it, but it probably doesn't make any
sense.

-- 
With best wishes
Dmitry
