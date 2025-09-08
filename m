Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D9B4B49BD1
	for <lists+freedreno@lfdr.de>; Mon,  8 Sep 2025 23:26:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0780010E5E0;
	Mon,  8 Sep 2025 21:26:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="CAseqLXb";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE63910E5E0
 for <freedreno@lists.freedesktop.org>; Mon,  8 Sep 2025 21:26:13 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 588GpjD1028233
 for <freedreno@lists.freedesktop.org>; Mon, 8 Sep 2025 21:26:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ew5MG2YGxdvZ9dDI+UbP3xwO3aQkZtMmI4KUi7ex/LA=; b=CAseqLXbWnbuNaiz
 Zyh/nK1vgXCiGOfJ30Tn2i1riKNUXgoanNcoGko9iHRPCkQXX7MdvlJp6/9utbr+
 XYtGh9jTpWE2BZGWpg74jNEqRNq8Vy12nJN1UCCSSCkU/7ydrqZXBiwr5R7OCSmp
 X98Fs3niw2FqSe2w7D4JFlD3REOnXMm5CH9DmBD257Zr5ZCTsmUUmcKXzoRh52RZ
 MRI/ybhx9O/oFKAcCNSpgG2G3jK9usimPivLMI/AHrk3mSRt/SjIWAkSHGRuJKYk
 ILQrU81jq4WLMcBEqDt8JJ0SWZICc3S0oYR541bk47T6Q497Zi+99WHJAKdsi1fB
 TtU2lw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490c9j63t4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 08 Sep 2025 21:26:13 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4b5e9b60ce6so114385061cf.2
 for <freedreno@lists.freedesktop.org>; Mon, 08 Sep 2025 14:26:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757366772; x=1757971572;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ew5MG2YGxdvZ9dDI+UbP3xwO3aQkZtMmI4KUi7ex/LA=;
 b=CCS/WmQ0cGRsPhgrO09afmTouHHL0bDB+rafJhTU1DGhVck3YK5jxAL+eqrdl7oPeh
 vrnnxoMPJl23BKedG21KL3etqDnoQaqNT00dA/kkLF7dBxyBc4m45eFYx3oDBFlPVkAd
 GhYoOHKqFbLN0m5iYTx9wPSw35CKpWGRm4hdmY5hqTimeZP9uD6l1sVvTFj/pm2Q1n7h
 XaJ1ZykQdGMiHmTcpjwSsnsnP9wcRbFpd8PBQoJSviuTDB0U4N5oRVsJS1NSKn2al5Py
 E70NBtJSULvpwK/9UJdGWXoeQjzl+syBKKZie/H0oGdlRCnmcq/aCIqMUg+aNBJBbt1o
 0lxw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUcx8hfr04teXbvm78RHfYDEDxjlCZclStS+wKbbEsBGeW5LGmBD/0L5Ys44hLYdqbKx8mnJScaecs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YynYLfuAQUrfuHiuGsPeezjHVVFLSudygpKll1JHLyWB0pFQiyn
 MGyQiYnpzqY/UZxfBP9fIN5GWwqveu/AgMIzSabvnV0ywFKj00ghCXk6pzsGPNRWXgXJDAooJkt
 Txqzj+/5s4JyBVgFUZsnRAxtWsmcN2houiWzbKlqSM95Ka4KVm2BUJ7wAiOZupGt1VudCG9o4s2
 dlctA=
X-Gm-Gg: ASbGncsQEHkfdcRgOouOUnZ/ZYvxh0AM64aoK3iYiy3NYEuqmff6AuXihyM1kn7W+zw
 n7/nsL0rkK7AFEv7j0J5Ub5yIOUja/nR0kknxAVsdlAs0Om9RaT16KosNScH3ld889YQTfFGMN7
 K+adLT4VeqY1KB1F22f51E8g43/7GxaoOc/SmdJdH0qB2c3Ezifo3rVBc8OSoZDnhhKMf1bumDn
 KjuT2ar97SpJMHZA6XktpJFHsQUbmrZ/Kk1B7PfDlBAkFM7CQWTIxrmWIvD5CwwLrCC4d3EoQaq
 R/OC39Ahp8tCmgJgygGrdIiQdzf/U9foxR+0dfWtX2SmXvVmrBv/fKGFJyw3wGITZohpjyQ6me2
 +Paq4hr5ZiTqoJg98ZhI4W6+7mFUgB+BqWg8RcIGpvYoXRJnvg4np
X-Received: by 2002:a05:622a:24e:b0:4b3:6dc:afc7 with SMTP id
 d75a77b69052e-4b5f8589aebmr107253481cf.67.1757366771918; 
 Mon, 08 Sep 2025 14:26:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHqvSMdw2mnuWqudtOY9nHtMhpMBFO5TsecOKtwKK/b6W3wDjCyZDgaQNZbmDLC91j16XyVcg==
X-Received: by 2002:a05:622a:24e:b0:4b3:6dc:afc7 with SMTP id
 d75a77b69052e-4b5f8589aebmr107253151cf.67.1757366771278; 
 Mon, 08 Sep 2025 14:26:11 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5680cfe2496sm38381e87.61.2025.09.08.14.26.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Sep 2025 14:26:10 -0700 (PDT)
Date: Tue, 9 Sep 2025 00:26:08 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: abhinav.kumar@linux.dev, airlied@gmail.com, alexander.deucher@amd.com,
 amd-gfx@lists.freedesktop.org, christian.koenig@amd.com,
 dave.stevenson@raspberrypi.com, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, geert+renesas@glider.be,
 harry.wentland@amd.com, jani.nikula@linux.intel.com,
 jessica.zhang@oss.qualcomm.com, kernel-list@raspberrypi.com,
 kieran.bingham+renesas@ideasonboard.com,
 laurent.pinchart+renesas@ideasonboard.com,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, liviu.dudau@arm.com,
 louis.chauvet@bootlin.com, lumag@kernel.org,
 maarten.lankhorst@linux.intel.com, magnus.damm@gmail.com,
 marijn.suijten@somainline.org, mcanal@igalia.com, mripard@kernel.org,
 robin.clark@oss.qualcomm.com, sean@poorly.run, simona@ffwll.ch,
 siqueira@igalia.com, sunpeng.li@amd.com, suraj.kandpal@intel.com,
 tomi.valkeinen+renesas@ideasonboard.com, tzimmermann@suse.de
Subject: Re: [PATCH v3 4/8] drm/msm/dpu: use drmm_writeback_connector_init()
Message-ID: <zw23hgjduxgijown52jyiomungxx4cjyv63qixtnx5nbm3w7xb@2yy65777ydnj>
References: <20250819-wb-drop-encoder-v3-0-b48a6af7903b@oss.qualcomm.com>
 <20250819-wb-drop-encoder-v3-4-b48a6af7903b@oss.qualcomm.com>
 <78c764b8-44cf-4db5-88e7-807a85954518@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <78c764b8-44cf-4db5-88e7-807a85954518@wanadoo.fr>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAyMiBTYWx0ZWRfX/lqPRGG2QqbL
 fApErjhmwirlXBV/IEf+KxpyjxQY7lb4EiIkPxmNK1IbRmBOcEQd+BfNWej1UShq19bQdXJH0Df
 HYWwQTERzxD1rJCEVRqsp2oge3vjoL3jQ+rLE7prKH76jUbwr8BHXE8dWYL5LuD/noFq+PIPU7b
 GIkfVz6WEFYkLbaZOwdhMx3fIr76f1k/wwFFpHA6s8MLPsyfmb4BF9YuAOyscSD0A0aDkJL69qU
 BlFwC7afxsexeVeSAShu7bTU2GWlNetHAsFwtHk8vNEtq581/5Do9zVqd/G1NdHOP/mwhZIQ+ng
 3fHjikg++6ESwFzy6MOUxSu/Ld1nzS/50EErM3PMepf4bzuJ3RnB4eTVESpRrzHKkuwysxH6xT0
 vPtxK906
X-Proofpoint-ORIG-GUID: mJeOoDKFKpOQ5IGLMe9ad5_OD2GM7yGF
X-Authority-Analysis: v=2.4 cv=PpOTbxM3 c=1 sm=1 tr=0 ts=68bf49f5 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=TSbVqHtbAAAA:8 a=ieunMBFP7PMWw6OMX0QA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=NJcUIoPEKLAEIzHnl83t:22
X-Proofpoint-GUID: mJeOoDKFKpOQ5IGLMe9ad5_OD2GM7yGF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_06,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 adultscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060022
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

On Mon, Sep 08, 2025 at 11:09:07PM +0200, Christophe JAILLET wrote:
> Le 19/08/2025 à 22:32, Dmitry Baryshkov a écrit :
> > Use drmm_plain_encoder_alloc() to allocate simple encoder and
> > drmm_writeback_connector_init() in order to initialize writeback
> > connector instance.
> > 
> > Reviewed-by: Louis Chauvet <louis.chauvet-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
> > Reviewed-by: Suraj Kandpal <suraj.kandpal-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
> > Reviewed-by: Jessica Zhang <jessica.zhang-5oFBVzJwu8Ry9aJCnZT0Uw@public.gmane.org>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov-5oFBVzJwu8Ry9aJCnZT0Uw@public.gmane.org>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c | 10 +++-------
> >   1 file changed, 3 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
> > index 8ff496082902b1ee713e806140f39b4730ed256a..cd73468e369a93c50303db2a7d4499bcb17be5d1 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
> > @@ -80,7 +80,6 @@ static int dpu_wb_conn_atomic_check(struct drm_connector *connector,
> >   static const struct drm_connector_funcs dpu_wb_conn_funcs = {
> >   	.reset = drm_atomic_helper_connector_reset,
> >   	.fill_modes = drm_helper_probe_single_connector_modes,
> > -	.destroy = drm_connector_cleanup,
> >   	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
> >   	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
> >   };
> > @@ -131,12 +130,9 @@ int dpu_writeback_init(struct drm_device *dev, struct drm_encoder *enc,
> >   	drm_connector_helper_add(&dpu_wb_conn->base.base, &dpu_wb_conn_helper_funcs);
> > -	/* DPU initializes the encoder and sets it up completely for writeback
> > -	 * cases and hence should use the new API drm_writeback_connector_init_with_encoder
> > -	 * to initialize the writeback connector
> > -	 */
> > -	rc = drm_writeback_connector_init_with_encoder(dev, &dpu_wb_conn->base, enc,
> > -			&dpu_wb_conn_funcs, format_list, num_formats);
> > +	rc = drmm_writeback_connector_init(dev, &dpu_wb_conn->base,
> > +					   &dpu_wb_conn_funcs, enc,
> > +					   format_list, num_formats);
> >   	if (!rc)
> >   		dpu_wb_conn->wb_enc = enc;
> > 
> 
> dpu_wb_conn is allocated a few lines above using devm_kzalloc().

That's a valid point, thanks!

> 
> Based on [1], mixing devm_ and drmm_ is not safe and can lead to a uaf.
> 
> Is it correct here?
> If the explanation at [1] is correct, then &dpu_wb_conn->base would point to
> some released memory, IIUC.
> 
> 
> just my 2c.
> 
> CJ
> 
> [1]: https://web.git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/drivers/gpu/drm/xe/xe_hwmon.c?id=3a13c2de442d6bfaef9c102cd1092e6cae22b753

-- 
With best wishes
Dmitry
