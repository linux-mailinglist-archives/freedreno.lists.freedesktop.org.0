Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6B51CAA51E
	for <lists+freedreno@lfdr.de>; Sat, 06 Dec 2025 12:28:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C812010E2CB;
	Sat,  6 Dec 2025 11:28:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="fRAMgs9m";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="St8TGhIz";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED27310E2C7
 for <freedreno@lists.freedesktop.org>; Sat,  6 Dec 2025 11:28:19 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5B64l3hL1636327
 for <freedreno@lists.freedesktop.org>; Sat, 6 Dec 2025 11:28:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=eftNH50iSq+b1pQ7t2A41tuU
 7np/m1Ety8HH1ooE1SM=; b=fRAMgs9mCxazzXMzvY/ljPhA+e7OThl3YLhsj8ag
 E0+PTIudFHWg6pcpyS5dVUKEgLQEZjFp+y6zKUBesZtRUICX+Rn6X4SUtEH4SREF
 0FsGlxPwLVw3mjj7/nScJ1gkLbuxG0waYVBscNDBnvK2xuhSbNJTI0dP3WYXL9+a
 s8CX6KXW6q5TDl2KvW0GrNYKNkdLRUql9XF6eLXmTo4BZ0O2DgtYsXUEwaZI3naq
 7W/jEEsk1epwTBdXUFtdTQd0dXYTtx3yiUwzixFB/3p+Nf2ljpaMz9rvnnj1vZi8
 Ay9uoZglavJpHuWbrN3KSqMbokUI5/kFcN3+xnKj11Psrg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4avdnjrhfa-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sat, 06 Dec 2025 11:28:19 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8b1d8f56e24so647758285a.2
 for <freedreno@lists.freedesktop.org>; Sat, 06 Dec 2025 03:28:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1765020498; x=1765625298;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=eftNH50iSq+b1pQ7t2A41tuU7np/m1Ety8HH1ooE1SM=;
 b=St8TGhIzYhK0q8eODkjC96+jyqER4aybqsHJmj2kozN/gKwdUlpVCJOaG50OyYvQ8z
 yqClwv0MyWGTJzWTBnFExuuw2myWLTTCdh5zANOIGQjjJNl86sA7dSW8YHRhvbwvMQYE
 c7laBfMfKbYJ4Dqnipum+xf9GHyOVZGBn4lF+4yZYEVfdXBJlkswmLT3XlLQOpjhPjIj
 MOjuBL6Ncc5VN9ysPWIq3fCYCU5hzYWEFYmGBlCK+Tp+zl4MwH2oGak+zw+i0MnjggfP
 f8cbHoILUGWpwbCP0OijioVWrtNiottZ4LmMcPGOdvl+uT9svMieDYtwKDHNlWV+EAou
 Chag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765020498; x=1765625298;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eftNH50iSq+b1pQ7t2A41tuU7np/m1Ety8HH1ooE1SM=;
 b=Jzr++6URV24xShh5QHdHLmJRZhYnVZXl7lgEdnIfFSACpJbR7akL93ycsw11hL46sZ
 r3R/Is/eQbamNbORbYxTqYuzSHjn6hXEN8XTPuq6Z922oF37LcDvBzbIJ2rERNyBXifS
 exrRQb9qkkLaRBpyKyCb8554+aoCYYE1jLtPUMN30rK2ImNBBgKXJQUoMMZMpHwat6xV
 K1wR4Ov8LCNZnVCA1KNy6uYiRZ2uoZNNRkx19yhxRobvveztyP66B+tUNFlc5GhC+YDi
 fNCK5HjtjASK3dfdlwAD362Z8X+mVLBAYRgQtV0qFwzjJ+mry1HLa1UgolxHa1Tkl3nW
 +G0g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVYje5a2cTMUKemrDesiK54Kls946XgF7+zeq7GAeUyCnZKbZW0HgADwFwvSlJSjbVmSj/ML77SZYM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz5ANKyyaNPgXpsirHJQN7m8aTgL2wKd1Azcmdhi8YJy4E/Yzh+
 oFkn0DCIPb+/1cmpqUyuBQEWNCLurzqyofzsNSYMgjA/7IgVSbIpdblwFifOGeDsunShZoJ+p1i
 DfJg89YWcOI5z80jwpEHU8nKbHpP8Ybp9GS75AHeRrVAp7R5JFWMfZNfd2ZWPR40MgstDA38=
X-Gm-Gg: ASbGncubZKzCdyQh9Vky9TJb0JeYwPxJgxvcDkv/FemrfpWM1WBOUUOuvu23X7Ix/Io
 CJysEGExGbfdCalcWaWEos7+CckZKWCfvlS1QYmTRKTqSGdIgiB+ockshmI/zSBek6z+CsjJoiE
 xoTApf2itK0a7BPOGQPOTwDnRIhtP2zTMTTN+gZ9Uc+G85jw9OALa6s6UI0v0/AZ43fHWGjL5oJ
 qTWTpYseC27PEUtSHWnYNMqHctX6c5JwPvYamKnbeBphtO/tT4oh03UdSH95R1L53637t6sNrXo
 XJZVI4V8jUuXAIdGFP7KgKV1IiyFelfHSK/XkHwa3Hi5jDtcQNFJjA8hJBA6bPGk+8JzvWl4ZuA
 yajxzwO0AnxX4zsKpCuhcuZUZQplqqwlVRzAlRjyFI6KB8EpgP5rhhg+daRUfjWJxaQUvCLsMGd
 NJgAwR8IDQsWcnJCoLjZ4BJLQ=
X-Received: by 2002:a05:620a:6cca:b0:8b2:e0ad:eb97 with SMTP id
 af79cd13be357-8b6a23f9f27mr297013885a.83.1765020498335; 
 Sat, 06 Dec 2025 03:28:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHJHWqoex+xRiDmmBbNdl3f9VzwXv1wYvWtOWvVciq53luinVftKkSOrV0+ulKIRpu8jICgkw==
X-Received: by 2002:a05:620a:6cca:b0:8b2:e0ad:eb97 with SMTP id
 af79cd13be357-8b6a23f9f27mr297010485a.83.1765020497870; 
 Sat, 06 Dec 2025 03:28:17 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-597d7b1a5d7sm2399030e87.15.2025.12.06.03.28.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Dec 2025 03:28:16 -0800 (PST)
Date: Sat, 6 Dec 2025 13:28:14 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Daniel Stone <daniel@fooishbar.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
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
Subject: Re: [PATCH v3 00/11] drm/connector: hdmi: limit infoframes per
 driver capabilities
Message-ID: <5dyhjur3hkhvtlwrl4h2m342byor7f3ssvkunj4cggnhbhlmnb@l2mfz7ypjj37>
References: <qx5ashx62pufott6hnsfna3qntnoyvxwxze4rihhuxcsdxi37s@bbdvc3sfsgne>
 <20250929-gregarious-worm-of-memory-c5354d@houat>
 <itgffxygopi7etkt7xhvmyuvyl5ad3k43nsxvjzw3ubtwiikn7@ocugfdaigtu7>
 <20251003-uptight-echidna-of-stamina-815305@houat>
 <zpygq4kapil3swsmhhqkdwny4ry2dznnzixsw5rkza5p2kqnvp@abvf2vxlbwif>
 <2a5fitdzr2bz235fj6rvqzxr6ckszkjbazjfszlvnizdh2cvbt@w3ypjo7vahhs>
 <pibxhl5hlcpuk3zsgyienfdlda5cwuxrnofwlw356scuzzplqy@zw3ofelgvwik>
 <bsoqyzxi45i67jpzhwr2d4illufa5ghqf25z6flbp67lsbvh22@rrlcihp2oxea>
 <cgzclxjubj5oca3rdnv44qwrkmpddxve4tlz76cc6p3b4hz3oc@3l7mt5ha7do6>
 <20251201-enlightened-zebu-from-asgard-5a20be@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251201-enlightened-zebu-from-asgard-5a20be@houat>
X-Proofpoint-GUID: BgeMU1w5GfdNsp8EhPEEC34YW02gskBH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA2MDA5MiBTYWx0ZWRfX89wj4hGYD4Dx
 nuDef3kY/+blOixJYdWMnW1L2yj/lm1GKdyZYyd4/5n1ydXNLUWyO+cbC0ro7c0GwHnmGd9ZOlp
 focHcRiSu0jcld3/sB5dmdwfxe3UI3mHjCYhJav0GPlKyBRF6fAIOjdNmYKhuokcu9ca4Vs/waN
 dfq3LijnfVhHgsSV+hJYQr+79ALpb1XtD4OHjICd5RIEDGybu7uN23BWWQN3kMTCW4IQHMSXu9k
 8BVcLjXCtENVe/F1Djzd3f1mhjUemvY3RjDy8I4OLjPKdSaWUmIYC3Vtr1FN1z1YFd3y9UZg6jl
 4T8Vi6yK5nFdDVMENzvJ3VWd2DDGkmOeCRVSrJLM0NISCb0H7U9xAQth47abYs3rptt3B4tjnnu
 cT2P+uaaP58pRjeGgsry0tEW4RGjyQ==
X-Authority-Analysis: v=2.4 cv=RvbI7SmK c=1 sm=1 tr=0 ts=69341353 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=dcO_3dQx6njePB8vrlkA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: BgeMU1w5GfdNsp8EhPEEC34YW02gskBH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-06_02,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512060092
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

On Mon, Dec 01, 2025 at 06:01:56PM +0100, Maxime Ripard wrote:
> On Fri, Nov 21, 2025 at 07:09:01PM +0200, Dmitry Baryshkov wrote:
> > > So it's not really impossible, you just need some hardware and a day's
> > > worth of work.
> > > 
> > > There's no reason these should get a pass, it's breaking the spec for no
> > > reason.
> > > 
> > > > > For SPD, It's really not clear to me why atomic_check should do that in
> > > > > the first place. Your initial concern was about exposing infoframes in
> > > > > debugfs that wouldn't be used by the driver.
> > > > > 
> > > > > If the driver doesn't register a debugfs file for SPD, and ignores
> > > > > whatever is in the atomic state, what's should we force drivers to do
> > > > > that?
> > > > 
> > > > I really don't think that drivers should mess up with debugfs on their
> > > > own. Making atomic_check() disable the unsupported InfoFrames makes the
> > > > picture perfect: the DRM no longer tries to program them to the
> > > > hardware, DebugFS files stay empty, so the whole state becomes
> > > > consistent.
> > > 
> > > In the "bridge has no access to infoframes" case, there's really no
> > > infoframe. An empty file is "the infoframe can be there but isn't used",
> > > not "we don't have access to it and can't report them". Only drivers
> > > have those infos.
> > > 
> > > If we do split up write_infoframe into multiple functions though, I
> > > guess we could create the debugfs file only if the function pointer is
> > > set, which removes drivers' involvement if you don't like that.
> > 
> > I'm fine with not using HDMI connector framework for lt9611uxc.
> > Likewise, I think, it's fine to have empty files for the infoframes
> > which are not being sent over the wire for any reason (hw not supporting
> > it is one of the reasons).
> 
> I can't think of any other example in the kernel where an empty file
> means that the driver doesn't support something.

Okay. So we need to sort out implementing the split write_infoframes in
drm_bridge_connector. Any suggestions there? I'm asking, because I don't
want to end up exploding it.

-- 
With best wishes
Dmitry
