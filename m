Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9322DD23A33
	for <lists+freedreno@lfdr.de>; Thu, 15 Jan 2026 10:41:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3514E10E72A;
	Thu, 15 Jan 2026 09:41:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="jRr8tM8E";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fwLXP/XE";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 543EE10E71F
 for <freedreno@lists.freedesktop.org>; Thu, 15 Jan 2026 09:41:01 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60F6fgv51581827
 for <freedreno@lists.freedesktop.org>; Thu, 15 Jan 2026 09:41:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=KZbtfwVixV70GKFxqCodeAZx
 DcfZgnV19oKW0cgK7+I=; b=jRr8tM8E6Zq5i90RJcBqaunvEW5vzSngxpni21sO
 lrRBzI75AufEPEH/TnTnjGDV41lCnDw0yEjeNuRa31zc4rYr8/VELGLojDYoIMt4
 7MF1yK+L6Q7tAGrV56k+k1k71+Ww0RFhhSLjjsGOXqVq1dTdVhwOMlzMNWwsUURh
 7/zjfUmIOrSNwTgWzk5Or76iOqNaUkM9Qs/DGtq6z5RW//PzAv8sIPLcX5zYcrX7
 1R3TLAhMdJFIsETQWo1Oe00yFAB3lcC3Eki+W9O1codPJxEsjKOnhW66oJe3Jox4
 siqX9LzwyCgsRKGhy+um81RDE9FxUjLgGmz2l2TQWnOkjA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bpj1pt127-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 15 Jan 2026 09:41:00 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8c6a291e7faso61617785a.3
 for <freedreno@lists.freedesktop.org>; Thu, 15 Jan 2026 01:41:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768470060; x=1769074860;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=KZbtfwVixV70GKFxqCodeAZxDcfZgnV19oKW0cgK7+I=;
 b=fwLXP/XEZte5/3Lit4bI9jZEV+yskb9gD/WaM9AWHIp6e6udWPD591BzqxK12ZiivL
 if9l1fdo4Q7qvkgzDkrQdxdkuUvS6VLBlXqEdDzy9/7DanQcKiIaARPhCrYaBtCKmjKX
 6YS7cPjL2JGwSSreTwI52jeXphWbtnU/VxBEcwANxfSi1S+f430EOWXGnmOtcW1PopJ6
 sTHRcIPkhUJr8zzVnEmFRHb5Y47E7fC4A9cld+IlVFpVb9VZpVvA04XmNiiy6GwA1cAG
 cnR/06uI1Ar+QW2eK41iTcktNkIse5NM0UAY4S3FTFIhYlHf/t/eoIR1G0eV4PANCiIz
 49Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768470060; x=1769074860;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KZbtfwVixV70GKFxqCodeAZxDcfZgnV19oKW0cgK7+I=;
 b=ihYoDKuEqZ57P8I+J+3Hcy7xUIEKGi0crVHVgUal7trEyByaZtcJEf2TKtN8NT4woy
 EtxUL6yuyGPbb9H7YP5HBy4/JGmrjuQRZ/t5Ap4CsvlNqcisLtjiTz2RCJ1NO5+1fbwD
 UsCJfkTAsRis2y6qVxcuikFh1YdJMd3Hyp2DRQxE2qYqEY4QkjdVEECvQsfQTPecdnT+
 PgWDgf4ptLV1Yh6AcHfPLuQKJpZGMYLbPjB2yoKsL/f3Gc/ULN3tghTqcRM+GPml6EhU
 b5biZszmGqRl9v0hrT+INxKvBbU5fx84Ft/Op1Gr4VnpwXR9dRMQcrH0HFtpVjK42+WC
 C7FQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXWIvuQyIxh+cVRrufMHQz5LHgm0W6GtPArOyvLqhq2wp/9d73cFo/vGFOuoRtsaB4+OPy4ZVGljDY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzDX/2zeDwVglEZ8UKmfocPVAJsIzOIolcKQQzSPaQcEW+oLDHN
 1oym5G/MOKmEpswj+3OQg3CYAGdydAbipYYNO4cT+RnK0KH/l1ojQFA/lZroTwx7phQbVEoJIRY
 Jfjj+luHkHKsIa5k+Tp3ZwSIdCZZ1jSkski/Xjjg8NMCArlMljF/9KmdXZPf6IcSfyIhzc4w=
X-Gm-Gg: AY/fxX7TA1aB7THyn0TK32dNkQtuuMR3hnJB2c+oxH6P/kIGUH7S0Ob6VoBcR1NZa3a
 eQc0KNB2u7q8DdbdsW3VB348dP0ifW57FWxMIMzFC3ef4IivrxHFa10SYdn5+oHdveV3tNF63zw
 NLUW9qs858it72JHwl9wdJi768i1SJ+SfTHzzGanRuoeZ+3FFS4xvshaP3v2jBdHXDUr5348GH1
 FXSUHAcHzUqAa3JQoKhQm8CHrlvFzJYiTgSTjfk0LqSVUy0yuqrVwg9DpuA2JgDM/xuZ2TBmclC
 RDxc9YN2aRrsB7kICeHZBK51eO/ULoKsm+tDPAMeVD23VE/clEtawzD9G0xb9GUxmQ9ZmWo35X1
 R1hO5DWSHn0cgOsvh8+zkDZVsqqFVbcKAdoUYS514aiqobjvHQcR9V/3yJfZ0luxpe+FDzoBn+N
 d53sCGCY/NTEZ6dvEF30zJhVE=
X-Received: by 2002:a05:620a:29d0:b0:89f:19e:46fa with SMTP id
 af79cd13be357-8c52fb153c4mr792407385a.20.1768470059804; 
 Thu, 15 Jan 2026 01:40:59 -0800 (PST)
X-Received: by 2002:a05:620a:29d0:b0:89f:19e:46fa with SMTP id
 af79cd13be357-8c52fb153c4mr792404285a.20.1768470059303; 
 Thu, 15 Jan 2026 01:40:59 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59ba101b46esm1544288e87.10.2026.01.15.01.40.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jan 2026 01:40:58 -0800 (PST)
Date: Thu, 15 Jan 2026 11:40:56 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Subject: Re: [PATCH v3 3/8] drm/msm/dp: Read DPCD and sink count in bridge
 detect()
Message-ID: <3bygazxh5sabn6jc7m5yd63s6igag2lt3hp46642b2tusxecb7@2zkhof4wr6rq>
References: <20260115-hpd-refactor-v3-0-08e2f3bcd2e0@oss.qualcomm.com>
 <20260115-hpd-refactor-v3-3-08e2f3bcd2e0@oss.qualcomm.com>
 <d826de45-f00c-4af8-947b-246362c2be23@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d826de45-f00c-4af8-947b-246362c2be23@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDA2OCBTYWx0ZWRfXy7EJcJ0icEzu
 cTaEA5ioVdwlqFAfeWF7DYxclN6edt0MWq0oDNr7iLVDDKVRzGaIVRiezVUwvcwO2uq0ZMK8aQH
 g+V/b7qsnAvXOZaLWdEMx+JKXqcQdeJpvMVsdoaG3ChT7uE7uUKegaqeHZvSda+bvqrJg+gDBh+
 lDTgl1j6l1Jm6w18jdSkD3boY5Ff1+FAr/jfxmHxTg9v/xDSU0Z8kB31GzxXtqRKmWHrhBuskvG
 DKTFWXChsPN4nkujlQynqycxvFwklox08FXJ+TCz7Ioy4afeTA3I14J33bKaUOMXyWYsSG/N0sz
 C03MX07tm3Ndlz2hXygvKSD/6obLJtDQHa9xcvbK047tFHxN54dsL5qCys5mv+V/DdvWajw6xz1
 ctvHexfrBUFqdeoksMexmzPBci1m5UetDaJ0pUr6QlI5sL0qqOGxhBaupOqCg8GmnAibtlHcJMp
 a27znrh5JpE0mx1wsKQ==
X-Authority-Analysis: v=2.4 cv=J+KnLQnS c=1 sm=1 tr=0 ts=6968b62c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=riCNDKHef0uOy52QCggA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: 2DKIcVybnTeoHIgffhc_k0YqgE-MJHVh
X-Proofpoint-ORIG-GUID: 2DKIcVybnTeoHIgffhc_k0YqgE-MJHVh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_03,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 clxscore=1015 suspectscore=0 malwarescore=0 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601150068
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

On Thu, Jan 15, 2026 at 10:19:27AM +0100, Konrad Dybcio wrote:
> On 1/15/26 8:29 AM, Dmitry Baryshkov wrote:
> > From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> > 
> > Instead of relying on the link_ready flag to specify if DP is connected,
> > read the DPCD bits and get the sink count to accurately detect if DP is
> > connected.
> > 
> > Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >  drivers/gpu/drm/msm/dp/dp_display.c | 60 +++++++++++++++++++++++++++++++++++++
> >  drivers/gpu/drm/msm/dp/dp_drm.c     | 20 -------------
> >  drivers/gpu/drm/msm/dp/dp_drm.h     |  2 ++
> >  3 files changed, 62 insertions(+), 20 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> > index 5997cd28ba11..a05144de3b93 100644
> > --- a/drivers/gpu/drm/msm/dp/dp_display.c
> > +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> > @@ -1151,6 +1151,66 @@ static int msm_dp_hpd_event_thread_start(struct msm_dp_display_private *msm_dp_p
> >  	return 0;
> >  }
> >  
> > +/**
> > + * msm_dp_bridge_detect - callback to determine if connector is connected
> > + * @bridge: Pointer to drm bridge structure
> > + * @connector: Pointer to drm connector structure
> > + * Returns: Bridge's 'is connected' status
> > + */
> > +enum drm_connector_status msm_dp_bridge_detect(struct drm_bridge *bridge,
> > +					       struct drm_connector *connector)
> > +{
> > +	struct msm_dp_bridge *msm_dp_bridge = to_dp_bridge(bridge);
> > +	struct msm_dp *dp = msm_dp_bridge->msm_dp_display;
> > +	struct msm_dp_display_private *priv;
> > +	int ret = 0;
> > +	int status = connector_status_disconnected;
> > +	u8 dpcd[DP_RECEIVER_CAP_SIZE];
> > +	struct drm_dp_desc desc;
> 
> Reverse-Christmas-tree would be nice 
> 
> > +
> > +	dp = to_dp_bridge(bridge)->msm_dp_display;
> > +
> > +	priv = container_of(dp, struct msm_dp_display_private, msm_dp_display);
> > +
> > +	if (!dp->link_ready)
> > +		return status;
> > +
> > +	msm_dp_aux_enable_xfers(priv->aux, true);
> > +
> > +	ret = pm_runtime_resume_and_get(&dp->pdev->dev);
> > +	if (ret) {
> 
> See ef8057b07c72 ("PM: runtime: Wrapper macros for ACQUIRE()/ACQUIRE_ERR()")

Interesting. Something fun to learn.

> 
> 
> > +		DRM_ERROR("failed to pm_runtime_resume\n");
> > +		msm_dp_aux_enable_xfers(priv->aux, false);
> > +		return status;
> > +	}
> > +
> > +	ret = msm_dp_aux_is_link_connected(priv->aux);
> > +	if (dp->internal_hpd && !ret)
> > +		goto end;
> > +
> > +	ret = drm_dp_read_dpcd_caps(priv->aux, dpcd);
> 
> 
> > +	if (ret)
> > +		goto end;
> > +
> > +	ret = drm_dp_read_desc(priv->aux, &desc, drm_dp_is_branch(dpcd));
> > +	if (ret)
> > +		goto end;
> > +
> > +	status = connector_status_connected;
> > +	if (drm_dp_read_sink_count_cap(connector, dpcd, &desc)) {
> > +		int sink_count = drm_dp_read_sink_count(priv->aux);
> > +
> > +		drm_dbg_dp(dp->drm_dev, "sink_count = %d\n", sink_count);
> > +
> > +		if (sink_count <= 0)
> > +			status = connector_status_disconnected;
> 
> < 0 would be an error coming from drm_dp_dpcd_read_byte, should we log
> it?

I'd rather not. At this point the errors might be coming from the cable
being not so fun, not settled, etc.

-- 
With best wishes
Dmitry
