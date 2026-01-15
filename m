Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDD97D27C69
	for <lists+freedreno@lfdr.de>; Thu, 15 Jan 2026 19:50:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A9CA10E225;
	Thu, 15 Jan 2026 18:50:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="TWOQR84e";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FKig3ysO";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E24010E225
 for <freedreno@lists.freedesktop.org>; Thu, 15 Jan 2026 18:50:56 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60FFYXSd2981359
 for <freedreno@lists.freedesktop.org>; Thu, 15 Jan 2026 18:50:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=JTDQ8EZQyOUY5F7DTRAbDbUi
 E/JxgTUqlUKictmW1Sc=; b=TWOQR84eZh365MSByIFKohPlhylJL/6ZlMf9ykoU
 BWHTI0fPZexY3/bM5SH+09khdKH0w3MJJ69dhPbePUAlAQ49TW+QeWpzlDDOofTx
 b+nm581QF4v8D55wJww87SxKdCzNumYhgcwwZgIF1KsXW7l3iJcejNZAH4Quyuum
 I+EAq3Ot6rdPFO9P+92ZObrkg6HQOYMa7eHfDQUCzWvWQk+gKWkuRjpTx19UKhvb
 Fu2xvNsAKTCj//4kQagsDcm/Ai8Jwduqjhj4XUZ2Cyh7Y+3fDPKdFeRBza+ajp8h
 ZtNCc0W3lVHMzi+/3PyaLua8N25rc+SoLU+msSyzjNWhHA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bprej2kax-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 15 Jan 2026 18:50:55 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8c6a69b7813so20620285a.0
 for <freedreno@lists.freedesktop.org>; Thu, 15 Jan 2026 10:50:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768503054; x=1769107854;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=JTDQ8EZQyOUY5F7DTRAbDbUiE/JxgTUqlUKictmW1Sc=;
 b=FKig3ysO1iKSxROaq3OCTYRksy/8U3S/7XeQkaCyqYhNw+UHacseexyXS8GsU7R1XM
 7Pkwm9lnuCJ3ivTzNf6+BDGPSMhB9siTs3DiYH838gVb4evOm78v51ZN2nlri+DXuNco
 r3ZZFFTnfkZVsCsfpfV7p9OTm2aAFz+3GcuEudhPicB6FYQf9yfck4yhgP2aACfzmGQC
 uzzaaP3eyN6VEOfuMQWYj/DsKVSL8t1I1S7ySx9djODIZMAnuA+vT6w/HyFLTDNiKTdu
 p6EoYndbjZNr57Oj9hFqRQ07D+UFhWf7hAJFACJZOKqfquimk1GsaWOBAAwOlLlq2l4F
 4M1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768503054; x=1769107854;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JTDQ8EZQyOUY5F7DTRAbDbUiE/JxgTUqlUKictmW1Sc=;
 b=TEpLYvT2I1oBnFEX/wZ1WUE64gzfwHPHlMyJChd0LcMKxAepF4J8aRYmH04HnrQpLv
 vbeUQblWS3F6APiGoi4oLvrkKo0oB4anRfmnIJMWH7okaqdX0hQbt1IRT4GC/1h0bq3w
 khCV3OPW5MBAmWzUtVOHgrUDWgueI82Q371jg+8TuD/cFscyJc+4NxUVDj+of/FCrDSN
 K2de6raPfiW2aVRcKimdo6dPZOXRtEG0TTMO6YWz784S/UbiKMI3DkohlW7Y91SKeYLT
 F3nYNqVvSL/mC9mViLOEwhhFlYiXktGnT1WArqDhqr3/L+mQjjDNVr4h6Nss4lEB8SLh
 ABgg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWiKAE0dts36CmXg45tzQ/VtoCQHEPPnV78lMyPgNqlSVWKx5d708Hg6hoZATwFlno1hWb4CC/qL4A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw3wiHXh4XALsLf55gHwoQFYTiOruh5mb+CLpQN9//IuJra+geo
 8DgVVoKYcczMWqQpeD59iDH+Mj8bBp4yg4WpKeGq671tPi4jqWp+sy6NaH+1PlDgjwZnn6W8ORR
 utH9PsbGOmdEhw27ucqjvVp/ZlwbQ2elgOEr7FpwolW7bzd9a3S20puaS+XjdM+t7rSfAXHE=
X-Gm-Gg: AY/fxX72x2jYDWEswLddpPJN0jQ+QQnfv16dMLhWmMAnct3KZaE3FVYxyHGmz6b8bCa
 IO2iUGZ26A6JpSlaPgTr6tSYg4B3i7OFd0vQTESWaOitstUKzVbwWlJiDzWGXO2PTH+VJymm+02
 DiE1io5wrjdgPTLlY1Xui9MChhqtL/997desyDWwIRFS35oiNJjhSlrS1+Mex47ywVJStmVfPtM
 PjT5VDxPOu2dBBhOT6DeD8gJsfL16slKB2qM73dN3pkWEssm5m1mYQ/HUr0Vcd4CMBoHwaq3j3Q
 SGmSDhzwGq8qCTm5SHfEoJ1oGLW+y9Ah6qcpiF13BCEcfwEY6rjS3KSucRZS9A3Bb/lBsWoLJ8y
 2dn0U8G3Hut2WmTrsxZoj/Sq458S0QiOlFoa5jE4NlVOrk13cycnPPTH/G693Evn1UmeVTigC6M
 G0rd20q764RbWfOtjGh+X9feQ=
X-Received: by 2002:a05:620a:7102:b0:8b2:7679:4d2d with SMTP id
 af79cd13be357-8c6a6948169mr44165285a.63.1768503054539; 
 Thu, 15 Jan 2026 10:50:54 -0800 (PST)
X-Received: by 2002:a05:620a:7102:b0:8b2:7679:4d2d with SMTP id
 af79cd13be357-8c6a6948169mr44161785a.63.1768503053988; 
 Thu, 15 Jan 2026 10:50:53 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-38384d3ded3sm1016811fa.9.2026.01.15.10.50.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jan 2026 10:50:53 -0800 (PST)
Date: Thu, 15 Jan 2026 20:50:51 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Subject: Re: [PATCH v3 4/8] drm/msm/dp: Move link training to atomic_enable()
Message-ID: <i2cjyphx5olz4l25pdbt2yso7ryoc4usbnl27ovrou3ih6rptl@prp5lhv56bt7>
References: <20260115-hpd-refactor-v3-0-08e2f3bcd2e0@oss.qualcomm.com>
 <20260115-hpd-refactor-v3-4-08e2f3bcd2e0@oss.qualcomm.com>
 <5b4870fc-911d-4574-a0ce-59428cbdf103@oss.qualcomm.com>
 <s5u3th3xw5rbaokoky3zhqhirbmfjljd32oqvyprabkx3xy4uo@tmc2l5domvpk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <s5u3th3xw5rbaokoky3zhqhirbmfjljd32oqvyprabkx3xy4uo@tmc2l5domvpk>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDE0NCBTYWx0ZWRfX3MlRMvHnv12r
 UjmRHS/eM90Bnv2ojTPV6xr4zuaIAxfuI/ptTVmQSzETlugvoWdUP4rR0I46V1aXYOaSUIHDB7S
 lp051OcovHQf6oUiMc0fD5umkqbh7rspRo6CUrV/0RF/y6uIX3LRe2yisn32mG61rO0j9rCwhBS
 VJF9ilixnlxSj8ysUeGPJE3UZAFJ/Tr6GJhABiFbNw3Lsn+K0/Eij84XUTNtlfIeznVGNtBiv+D
 Hqn5RZ+SIt/sKNW9xL4eU7VeHTlXhKaCzoLviUs2jMaRhsfN9O/3L5cpfGkKACq2Q59P6OImXfL
 G5U7Pd36MMUGlrFoZQ9GFhDf+Pk9KghT1AQePFppXUGEa5Cn7EOZ5CWDdjowYNulu+Hh5HBBN3c
 JHTVj4t+ZdasRBOm0hTyBG4jJlNSEq0EfGdWrnLITBrU/aUR9Fd+VTMnev1v0enDUXCwbwoLqsj
 y/rj/Mdo4u1QnJPHMqQ==
X-Proofpoint-ORIG-GUID: ZMm3lyIOgOsNpNmVNf4YVICFKx4L2GLG
X-Authority-Analysis: v=2.4 cv=Rc+dyltv c=1 sm=1 tr=0 ts=6969370f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=hGIm1wR9W1a6VHt1PZMA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: ZMm3lyIOgOsNpNmVNf4YVICFKx4L2GLG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_05,2026-01-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 clxscore=1015 bulkscore=0 malwarescore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601150144
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

On Thu, Jan 15, 2026 at 09:39:29AM -0600, Bjorn Andersson wrote:
> On Thu, Jan 15, 2026 at 10:30:49AM +0100, Konrad Dybcio wrote:
> > On 1/15/26 8:29 AM, Dmitry Baryshkov wrote:
> > > From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> > > 
> > > Currently, the DP link training is being done during HPD. Move
> > > link training to atomic_enable() in accordance with the atomic_enable()
> > > documentation.
> > > 
> > > Link disabling is already done in atomic_post_disable() (as part of the
> > > dp_ctrl_off_link_stream() helper).
> > > 
> > > Finally, call the plug/unplug handlers directly in hpd_notify() instead
> > > of queueing them in the event thread so that they aren't preempted by
> > > other events.
> > 
> > I think this part of the commit message no longer applies 
> > 
> > > 
> > > Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > > ---
> > >  drivers/gpu/drm/msm/dp/dp_display.c | 11 ++++++-----
> > >  1 file changed, 6 insertions(+), 5 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> > > index a05144de3b93..3184066adb15 100644
> > > --- a/drivers/gpu/drm/msm/dp/dp_display.c
> > > +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> > > @@ -436,11 +436,6 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
> > >  	msm_dp_link_psm_config(dp->link, &dp->panel->link_info, false);
> > >  
> > >  	msm_dp_link_reset_phy_params_vx_px(dp->link);
> > > -	rc = msm_dp_ctrl_on_link(dp->ctrl);
> > > -	if (rc) {
> > > -		DRM_ERROR("failed to complete DP link training\n");
> > > -		goto end;
> > > -	}
> > >  
> > >  	msm_dp_add_event(dp, EV_USER_NOTIFICATION, true, 0);
> > >  
> > > @@ -1695,6 +1690,12 @@ void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
> > >  		force_link_train = true;
> > >  	}
> > >  
> > > +	rc = msm_dp_ctrl_on_link(msm_dp_display->ctrl);
> > > +	if (rc) {
> > > +		DRM_ERROR("Failed link training (rc=%d)\n", rc);
> > > +		drm_connector_set_link_status_property(dp->connector, DRM_LINK_STATUS_BAD);
> > > +	}
> > 
> > Previously failure in this call would have propagated an error
> > 
> > msm_dp_ctrl_on_link() enables mainlink clocks, so 
> > 
> 
> Missed that one. I guess in practice it's not much difference from the
> previous behavior - where the display just wouldn't work either, except
> for the crash you point out below.
> 
> It seems to be that it would make sense to return an error to userspace
> when this happens, but the kernel-doc says:
> 
> """
> The bridge can assume that the display pipe (i.e. clocks and timing
> signals) feeding it is running when this callback is called.
> """
> 
> What's the expected error path here?

None. The only thing we can do in atomic paths is to set the bad
link_status and be ready not to crash (especially at the disable()
path).

> 
> Regards,
> Bjorn
> 
> > > +
> > >  	msm_dp_display_enable(msm_dp_display, force_link_train);
> > 
> > IIUC this will crash the machine if the above fails
> > 
> > Konrad
> > 

-- 
With best wishes
Dmitry
