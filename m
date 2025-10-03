Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08C93BB75B5
	for <lists+freedreno@lfdr.de>; Fri, 03 Oct 2025 17:44:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D755E10E1F3;
	Fri,  3 Oct 2025 15:44:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="RQhTjBBW";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DE4D10E1F3
 for <freedreno@lists.freedesktop.org>; Fri,  3 Oct 2025 15:44:04 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 593ACCGd012289
 for <freedreno@lists.freedesktop.org>; Fri, 3 Oct 2025 15:44:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=VpmyCQSwVSHUoaXADoES/PS2
 Nt6wPPE5Oo+SQuYPBFo=; b=RQhTjBBWXy492ZQ5oitl0/ncU2RqsCJsP2iZnU4/
 cUN5xZlWLiZKAgzdI/upQ6hgeHC5hN5lGTsXhIlE2XfbVI9TZY1UHCZD3Gd4muff
 1QUMrbTLtwCnTRi3vQnqUGdb67iiCXim4OwNQdi88K+iJcl0u8bzP3erzkLJVgwJ
 GrOSD4NOcyLp8g74JHe84L71gnkVAYo91PfzFUgQnlj1AH6bPIBy9I6Vt3glm0xv
 uYB6B4ifRgZASNHtWgSGItx8azVoLR2LfRA+ZMnmIX9q/dzd8yUUqIi54P34USpd
 oGdgu/BFubo9pMFvi9GBOx7ztXIYy6oosMUypb4nOTitvQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e80u3dne-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 03 Oct 2025 15:44:03 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4dec9293c62so57994661cf.1
 for <freedreno@lists.freedesktop.org>; Fri, 03 Oct 2025 08:44:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759506242; x=1760111042;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VpmyCQSwVSHUoaXADoES/PS2Nt6wPPE5Oo+SQuYPBFo=;
 b=TVY8C+B1stne1Cb1MaJ+0DMf5nRqWB+eBFLmWd/gKtidb0J+i2VF9PcI3/W7e87cFl
 3xLVXsBVm6JRBJEBZ8jDtfzpexETZ01CcGDItZsJnqhFImkZBtRXPlUKg7UAG4BCVvB4
 i0eg8ExOkQCqz49MbJOi0CIsRmvCO9aIUHtmnOle6LslL6hVlNBHbpUO+AB7xC2mht9t
 N06ECXPR6S8sA3kkYP/abwdGwwQCWpKQgMeupKQv0/tTZBx4dAEsJMBnCn8l4dGlKeMK
 WsSCOsjZ9gNOtaGZSsQUic+7nTm7Vd6cAh7eeCNHNph5iRZCnT40SDDRdue6uXnGwaIa
 mipw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXWWDduNppGVk3l/aORRTACMi5CCAiAkRuYwU3M7YFHq7rdwlgJZ+8EccAHs95MEMAkngZR5+I7LMs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw2lbr43FxTOEuaDQXS+QMXCqBtCPuuYrrs3tPJOfPpOX6LRPXM
 Tms5a6uOl3kyKI2KK+7Ja/nKHBT6fEoxOhwqU+0M0LcU7y1j2MIHfZZP15QcqThW9IXpCJj/hUs
 DrzRLRnJkQlesnLdKux+K5ewcf7LsVHGqjWjj0q4o3mL2J1/Xz0r2csw/foNUOcAcmCXkg/w=
X-Gm-Gg: ASbGnctPdyztK4rjhHxvHlGSWEwQ0Qj+ezY4wWTBSK9ulMMuwUgElQsiCGG4M9y1szG
 wHWrVWQnEqibJcE0noaNPNnxEl3IP4TcFSl3bmmzpPCuO71sXFSZ5Xhjhkl4ptPPRmFi1bP77Ca
 aZpueta+fcw5Mlq7cZQhxFsSI0myN+aYFcq0MsAeNoyF4TcwDQ/Ju6WoLK4F/PPRHKKaAhP5mqi
 ziueyY0/93bMi27BkZLb/D4KC4avdfh+FSVHZ/PkPYf/nKIUyPcGu2bAnI4s/+Y4SjEPjRmSHn3
 iQPDFxb1FFCFchYGHQcaHGQ9V8Wcxowzf2WmQgA6r4zV/2Yvjfd2Ud0b5VVJHeRbpsJ6lf4Lkf4
 AXmiH+ofSb8AbXTWh3V0jqes0Ch8kmL5Rly27U831We1SctPv5L+lPkDGMA==
X-Received: by 2002:a05:622a:4c18:b0:4b7:92f1:d641 with SMTP id
 d75a77b69052e-4e576a3c983mr44723741cf.22.1759506237327; 
 Fri, 03 Oct 2025 08:43:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEk8KP0+qQBfiT0cQx5+NTnJD4fSS7hPt/F8OokeMKesiR9A8s7Hs/Ap+66bRDgWCPAER6T+w==
X-Received: by 2002:a05:622a:4c18:b0:4b7:92f1:d641 with SMTP id
 d75a77b69052e-4e576a3c983mr44723321cf.22.1759506236780; 
 Fri, 03 Oct 2025 08:43:56 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-58b0118e04asm1929404e87.64.2025.10.03.08.43.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Oct 2025 08:43:55 -0700 (PDT)
Date: Fri, 3 Oct 2025 18:43:54 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Hermes Wu <Hermes.wu@ite.com.tw>, Dmitry Baryshkov <lumag@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH v7] drm/msm/dp: reuse generic HDMI codec implementation
Message-ID: <eyr6ipmk7jh5itr662fjvguduwecu54s7meqye6ga5odwelzgy@dgngrukrbogi>
References: <20250423-dp-hdmi-audio-v7-1-8407a23e55b2@oss.qualcomm.com>
 <DD8PK8AI24P7.YK0OGVYC0QFM@fairphone.com>
 <DD8RMPT8EHGF.17VY8M0ECB09R@fairphone.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DD8RMPT8EHGF.17VY8M0ECB09R@fairphone.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAyOSBTYWx0ZWRfXx4rqUPlF4LvJ
 fz/WFXMNiD0eCvGF4xYQwp6pyAI+o81KP4anOeiY3RZT8+UdXLoRSFUCfEPZUgyif5OyZOYB+HH
 M3zMwvHLwEzTUSoaCUAeZkAsgdlvj87lvq2qTvtcP4jMCb8AdYUVGiu15Ubeupuj3EASlROUUoB
 PlouK8ZY96JhGNOkKlh1aODX6phSU4G5oCQpYZux8tJ/ASyo1jtM89fuDgHajvLCvKWO+hitsxP
 xtq7B+lUP3mz/5DnLtem36iYwpk2JBlEB0U2tpzZbFFhhTNBi32EiBX+8lsX8MQF2NCSvealPGk
 SpgnhSTK4LQetKIWb3n/QFxYYRjCTlKHR3omGXNRpfdhjq5z5A5B8Vu2qcw9bswt3KoS2CcHGiA
 Y7rrRTTltqTwl5bc4HL1GE12Vuoshw==
X-Proofpoint-GUID: noDwyIKZanUwK3RsPrIlcpoeUDGd1aBV
X-Authority-Analysis: v=2.4 cv=OMkqHCaB c=1 sm=1 tr=0 ts=68dfef43 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=47WAYy97XgIT4h3jqLYA:9
 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: noDwyIKZanUwK3RsPrIlcpoeUDGd1aBV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-03_04,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 phishscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270029
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

On Fri, Oct 03, 2025 at 04:43:59PM +0200, Luca Weiss wrote:
> On Fri Oct 3, 2025 at 3:06 PM CEST, Luca Weiss wrote:
> > Hi Dmitry,
> >
> > On Wed Apr 23, 2025 at 7:52 PM CEST, Dmitry Baryshkov wrote:
> >> From: Dmitry Baryshkov <lumag@kernel.org>
> >>
> >> The MSM DisplayPort driver implements several HDMI codec functions
> >> in the driver, e.g. it manually manages HDMI codec device registration,
> >> returning ELD and plugged_cb support. In order to reduce code
> >> duplication reuse drm_hdmi_audio_* helpers and drm_bridge_connector
> >> integration.
> >
> > A bit late, but it appears that since 6.16 kernel (incl. 6.17) DP audio
> > is broken on qcm6490-fairphone-fp5 (which is using the Elite audio
> > architecture, not Audioreach).
> >
> > Git bisect is pointing to this patch:
> >
> >   98a8920e7b07641eb1996b3c39b9ce27fc05dbb9 is the first bad commit
> >   commit 98a8920e7b07641eb1996b3c39b9ce27fc05dbb9
> >   Author: Dmitry Baryshkov <lumag@kernel.org>
> >   Date:   Fri May 2 01:41:42 2025 +0300
> >
> >       drm/msm/dp: reuse generic HDMI codec implementation
> >
> > It's specifically failing with these errors:
> >
> > [  177.380809] qcom-q6afe aprsvc:service:4:4: AFE enable for port 0x6020 failed -110
> > [  177.380851] q6afe-dai 3700000.remoteproc:glink-edge:apr:service@4:dais: fail to start AFE port 68
> > [  177.380865] q6afe-dai 3700000.remoteproc:glink-edge:apr:service@4:dais: ASoC error (-110): at snd_soc_dai_prepare() on DISPLAY_PORT_RX_0
> > [  177.437004] qcom-q6afe aprsvc:service:4:4: cmd = 0x100e5 returned error = 0x9
> > [  177.437294] qcom-q6afe aprsvc:service:4:4: DSP returned error[9]
> > [  177.437312] qcom-q6afe aprsvc:service:4:4: AFE enable for port 0x6020 failed -22
> > [  177.437332] q6afe-dai 3700000.remoteproc:glink-edge:apr:service@4:dais: fail to start AFE port 68
> > [  177.437343] q6afe-dai 3700000.remoteproc:glink-edge:apr:service@4:dais: ASoC error (-22): at snd_soc_dai_prepare() on DISPLAY_PORT_RX_0
> >
> > Do you have an idea?
> 
> Dmitry pointed me to this patch on IRC which does fix the problem
> described above.
> 
> https://lore.kernel.org/linux-arm-msm/20250925040530.20731-1-liujianfeng1994@gmail.com/

I have been waiting for Srini to respond to the quetions that I have
asked in response to those emails. If he doesn't respond in a sensible
timeframe, I think, we should pick that patch.

-- 
With best wishes
Dmitry
