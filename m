Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 3yx/Kgesm2kH4gMAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Mon, 23 Feb 2026 02:23:19 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FC1F1714CC
	for <lists+freedreno@lfdr.de>; Mon, 23 Feb 2026 02:23:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1917C10E1E9;
	Mon, 23 Feb 2026 01:23:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ud7048ej";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LGlM4Bb6";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43E8710E1E0
 for <freedreno@lists.freedesktop.org>; Mon, 23 Feb 2026 01:23:15 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61MNXltq2565272
 for <freedreno@lists.freedesktop.org>; Mon, 23 Feb 2026 01:23:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 LIWV/5G0cokkb/ZR19QELLZ7l/8kTWWB4xWhDTbzvGs=; b=Ud7048ejNeHA4vkx
 dBfiqeKBe3ezm5lg13+EriNcftbqRh2pNfrtbDX0xRWSH9giXlonYlx4MhbCzJqm
 Tf1ZefGJxA78yDCLulCwRkOCmbhJY8hISgzm+fCyj7t0JjbzzalfJ/HJtHGO9rHJ
 zQMbntVc5jPeuoskFC8dT+6pGRdpObX0/RSAye0f5yDSLBhDVuOdKMam+m31gmH0
 cuPJEoXzwHTw4HUnxv4Hub197Zndup7eE7MmW6S/6llMYeKjQ53Qsc9i2PjjJKa5
 3UVo+8laPmWcCWwvyfphKneIam4tGj3+4kmH9j2Stl1LDejXcaW1thmuddm4IJ0H
 G3dAfA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5wyu0vp-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 23 Feb 2026 01:23:14 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8cb3a2eb984so522185085a.0
 for <freedreno@lists.freedesktop.org>; Sun, 22 Feb 2026 17:23:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1771809794; x=1772414594;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=LIWV/5G0cokkb/ZR19QELLZ7l/8kTWWB4xWhDTbzvGs=;
 b=LGlM4Bb6NYEtw5+j4N0Kk3KK+TwcGZ7nOOSxmgxNmN1p3+njny2518EIg/8HelCM3k
 +L06Tv90/wqR8H6C8zopX3lQkY/ws22WamfJ+5rd8D0HGxhmy93vssZhyLrPJwdvDPZq
 mxVRVMY339mOTmEkQ0W7DXjjWdJA3cZIPpX8DQYA2zcRmKPsDq+VOXmih3Ybf2O+f9Y3
 +2YqLBfauafgoCcDbxFAbYn3PRiTf/F6s4jAQQ+mD1qE72WGBGha+bdD5Scug7u5TgRq
 0T/5akdUg02f08xESuvOPokSUXfpYErZ03gMW9FbpOZDe68ONiwpyAA4ghPLV/HUXed4
 ZKng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771809794; x=1772414594;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LIWV/5G0cokkb/ZR19QELLZ7l/8kTWWB4xWhDTbzvGs=;
 b=G45ZpUa+anH7BUB4+yUHIWJ8BlpfoQkkgfv2am5OmaHJvKnjywot5yfTZc2n12YH+K
 4Qworvhu4yd+TRVGTu+AbpJywzR5rP5vgmfrvNAgYfl2/1WLLqw4jwwzH2xIq8rXY089
 CETHHUm3PLTWuZl/QsgwPpLZEBnfRQDaMVjPvaQFuVDM6sXe6ihbzpSZLjZVd+XiSPCf
 Z8MEZZBVeU9Q4Wf4xA+81ofiH/p76qSwyM7ImaYfUSViCMSgPFjV0T1lmz66DJi0RamF
 7IkDsVAABngr6dUU218JHvOnJZkvF9IVPw0Nek5mK3Tfe1ramu3PDWXVoWA9Karhabet
 fftQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVWAN2j1xDKipUBuH2kZCmUcXyEcfK32UH2+MXmUGca1dZnwzN1VAcjtpDSXyKvrgu8H7BFTztzaRI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz6AyHOigLqEXUjGjcBLEcKidFNV67xxCr9R0LU5POz85dcKkxx
 ng5oh5TQOXEz8FS2vI6+kAnuzakqXezZKCxgwk7pg4c+9cjEX7pmQi0Dxnp+gkv6GtUkDFdoxHo
 WAlB/2qa4DMCk0BPHyYHke0YnMRL7FasghdTfzXWDbm4X5oHZRIKURBadF2MO2e5qDOu6Bdw=
X-Gm-Gg: AZuq6aJ3Mys0XHIOTBsJa5ZoxmDsiC9faHbul7tjg+BCGp5QntzUIJHrfVajEN3NFVV
 HD8HJwWOrR+/ijUnWEFd/6lTyP5m0RwCBaJJ53k3i+gcwlIg1AlDeG2Ck+ajsVzck03CNP9B/wm
 EBZWgHzchuZAbcTk9FjQ7diOx9r1Nlvba13Yk3gHm0Lq4MDlvncCHtBWVx5ISqG0pUcOBjXcTc4
 wuBqlWQI9xku8a2ld8+/0g7+O60thFq2LVIOTU3nInEj8rLqUwaFGWTpxUz4VWiLQE6iqRZXrGg
 jJQVrlGjm8cqXsEtoJW2x2BGHFLg8fobCGYGgg/0bdcJXRMnJQmgmuidQYTroGfsc5Pd/4MH0+r
 V/9pGPJgcUg2ZvxMqW4jb4OMAq4dQNPrRcJr5IKbb983Pu3fjfhKR0YQJswDvUCgU37V7U4EGyC
 qKUyTnuz4H8XBzy5YYSwDAId7r5SzV+TM318k=
X-Received: by 2002:a05:620a:1927:b0:85c:bb2:ad9c with SMTP id
 af79cd13be357-8cb8ca656ebmr956476785a.53.1771809793603; 
 Sun, 22 Feb 2026 17:23:13 -0800 (PST)
X-Received: by 2002:a05:620a:1927:b0:85c:bb2:ad9c with SMTP id
 af79cd13be357-8cb8ca656ebmr956473185a.53.1771809793036; 
 Sun, 22 Feb 2026 17:23:13 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-389a78d2326sm13184151fa.15.2026.02.22.17.23.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Feb 2026 17:23:11 -0800 (PST)
Date: Mon, 23 Feb 2026 03:23:08 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 =?utf-8?B?TG/Dr2M=?= Minier <loic.minier@oss.qualcomm.com>
Subject: Re: [PATCH] drm/msm: add missing MODULE_DEVICE_ID definitions
Message-ID: <hpvt4dv3id6m26i4wvgngh6u553oag2vqc74anhs3q2ud57aqr@khrcib37a64d>
References: <20260219-msm-device-id-v1-1-9e7315a6fd20@oss.qualcomm.com>
 <d3119277-3205-49cb-81c6-1b12d10c5ec8@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d3119277-3205-49cb-81c6-1b12d10c5ec8@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDAwOSBTYWx0ZWRfX0rKQOHRfXqSd
 15lif64lKDw429vMGVvadCHWz9zqHyKbbZh3zT9XspUjJeynmJmazunQNV2HwTvSA18TTXMbFYn
 NpWrULfk/TToy5oyhUSxoz/vzv5c1TnBwvLyieuM75DEec5ZiBmDdz9hV8r1TQ5Eyea0G6mJ4a8
 4mBLGbtcV3XB5wHjeCB4MU+tZ7/tfRafjzze00LetnKlT6iygPp4mjDmxd1nqtPG5t/FpBYARqx
 cikDORZFXJZA17AWJCOGU6az2F4l9RlXdXSEk84NWpPx6kPTiCVdw24Al18TBW2gFhaEiEET+1G
 1ljSwt48gl8H3rVtlQQlkGTa2AdN7aaQDdnjD8LNxuLKis6K9Q3mt6b6waEEcZu7v6sJcqzwYZK
 WxZom/ZencJDSSljtoxqiEh7KFe0932DsVezHtLmb51yXqDRjOBuVKczGvEfR1xk/VaVjHxdS+L
 JUCQwinFS2GfpLJWwFA==
X-Authority-Analysis: v=2.4 cv=UO/Q3Sfy c=1 sm=1 tr=0 ts=699bac02 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=NFef1q2CqZPfa1XFr5gA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: XmaipZUz5EGFcmlQFqEETyPQ64Q4Ip9D
X-Proofpoint-ORIG-GUID: XmaipZUz5EGFcmlQFqEETyPQ64Q4Ip9D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230009
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:akhilpo@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:konradybcio@kernel.org,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:loic.minier@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[freedreno@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[freedreno@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[freedreno];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim]
X-Rspamd-Queue-Id: 0FC1F1714CC
X-Rspamd-Action: no action

On Fri, Feb 20, 2026 at 01:12:15AM +0530, Akhil P Oommen wrote:
> On 2/19/2026 5:49 PM, Dmitry Baryshkov wrote:
> > The drm/msm module bundles several drivers, each of them having a
> > separate OF match table, however only MDSS (subsystem) and KMS devices
> > had corresponding MODULE_DEVICE_ID tables. Thus, if the platform has
> > enabled only the GPU device (without enabling display counterparts), the
> > module will not be picked up and loaded by userspace.
> > 
> > Add MODULE_DEVICE_ID to the GPU driver and to all other drivers in this
> > module.
> > 
> > Fixes: 55459968176f ("drm/msm: add a330/apq8x74")
> > Reported-by: Loïc Minier <loic.minier@oss.qualcomm.com>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> > The Fixes tag points to the first commit introducing OF-based GPU
> > matching (and thus possibility for the headless GPU binding). Other
> > are not usable without the main MDP4 / MDP5 / DPU drivers, so they
> > didn't get the Fixes tags of their own.
> > ---
> >  drivers/gpu/drm/msm/adreno/adreno_device.c | 1 +
> >  drivers/gpu/drm/msm/dp/dp_display.c        | 1 +
> >  drivers/gpu/drm/msm/dsi/dsi.c              | 1 +
> >  drivers/gpu/drm/msm/dsi/phy/dsi_phy.c      | 1 +
> >  drivers/gpu/drm/msm/hdmi/hdmi.c            | 1 +
> >  drivers/gpu/drm/msm/hdmi/hdmi_phy.c        | 1 +
> >  6 files changed, 6 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
> > index 554d746f115b..4edfe80c5be7 100644
> > --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> > +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> > @@ -302,6 +302,7 @@ static const struct of_device_id dt_match[] = {
> >  	{ .compatible = "qcom,kgsl-3d0" },
> >  	{}
> >  };
> > +MODULE_DEVICE_TABLE(of, dt_match);
> >  
> >  static int adreno_runtime_resume(struct device *dev)
> >  {
> > diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> > index 476848bf8cd1..d2124d625485 100644
> > --- a/drivers/gpu/drm/msm/dp/dp_display.c
> > +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> > @@ -210,6 +210,7 @@ static const struct of_device_id msm_dp_dt_match[] = {
> >  	{ .compatible = "qcom,x1e80100-dp", .data = &msm_dp_desc_x1e80100 },
> >  	{}
> >  };
> > +MODULE_DEVICE_TABLE(of, msm_dp_dt_match);
> >  
> >  static struct msm_dp_display_private *dev_get_dp_display_private(struct device *dev)
> >  {
> > diff --git a/drivers/gpu/drm/msm/dsi/dsi.c b/drivers/gpu/drm/msm/dsi/dsi.c
> > index d8bb40ef820e..3c9f01ed6271 100644
> > --- a/drivers/gpu/drm/msm/dsi/dsi.c
> > +++ b/drivers/gpu/drm/msm/dsi/dsi.c
> > @@ -198,6 +198,7 @@ static const struct of_device_id dt_match[] = {
> >  	{ .compatible = "qcom,dsi-ctrl-6g-qcm2290" },
> >  	{}
> >  };
> > +MODULE_DEVICE_TABLE(of, dt_match);
> >  
> >  static const struct dev_pm_ops dsi_pm_ops = {
> >  	SET_RUNTIME_PM_OPS(msm_dsi_runtime_suspend, msm_dsi_runtime_resume, NULL)
> > diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> > index 7937266de1d2..c59375aaae19 100644
> > --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> > +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> > @@ -582,6 +582,7 @@ static const struct of_device_id dsi_phy_dt_match[] = {
> >  #endif
> >  	{}
> >  };
> > +MODULE_DEVICE_TABLE(of, dsi_phy_dt_match);
> >  
> >  /*
> >   * Currently, we only support one SoC for each PHY type. When we have multiple
> > diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
> > index 5afac09c0d33..d5ef5089c9e9 100644
> > --- a/drivers/gpu/drm/msm/hdmi/hdmi.c
> > +++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
> > @@ -441,6 +441,7 @@ static const struct of_device_id msm_hdmi_dt_match[] = {
> >  	{ .compatible = "qcom,hdmi-tx-8660", .data = &hdmi_tx_8960_config },
> >  	{}
> >  };
> > +MODULE_DEVICE_TABLE(of, msm_hdmi_dt_match);
> >  
> >  static struct platform_driver msm_hdmi_driver = {
> >  	.probe = msm_hdmi_dev_probe,
> > diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_phy.c b/drivers/gpu/drm/msm/hdmi/hdmi_phy.c
> > index 667573f1db7c..f726555bb681 100644
> > --- a/drivers/gpu/drm/msm/hdmi/hdmi_phy.c
> > +++ b/drivers/gpu/drm/msm/hdmi/hdmi_phy.c
> > @@ -204,6 +204,7 @@ static const struct of_device_id msm_hdmi_phy_dt_match[] = {
> >  	  .data = &msm_hdmi_phy_8998_cfg },
> >  	{}
> >  };
> > +MODULE_DEVICE_TABLE(of, msm_hdmi_phy_dt_match);
> >  
> >  static struct platform_driver msm_hdmi_phy_platform_driver = {
> >  	.probe      = msm_hdmi_phy_probe,
> > 
> 
> https://lore.kernel.org/lkml/20260124-adreno-module-table-v1-1-9c2dbb2638b4@oss.qualcomm.com/
> fwiw, there was a related patch that I posted recently. We can drop that.

Ouch, sorry, I forgot about it. I'll pick it up and then apply the rest
of this patch on top, adjusting the Fixes and commit message.

> 
> Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> 
> -Akhil.
> 
> > ---
> > base-commit: fe9e3edb6a215515d1148d32a5c445c5bdd7916f
> > change-id: 20260219-msm-device-id-84b95d22c0b0
> > 
> > Best regards,
> 

-- 
With best wishes
Dmitry
