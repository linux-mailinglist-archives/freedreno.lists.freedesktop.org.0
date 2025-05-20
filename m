Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1912ABE60E
	for <lists+freedreno@lfdr.de>; Tue, 20 May 2025 23:30:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD05010E0C5;
	Tue, 20 May 2025 21:30:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="iHCzveXQ";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B02610E094
 for <freedreno@lists.freedesktop.org>; Tue, 20 May 2025 21:30:04 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54KGiHoh019121
 for <freedreno@lists.freedesktop.org>; Tue, 20 May 2025 21:30:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=yp6gS6fiXRKVst4i/0JwkECc
 tK+Yj9KUJFbKtK5dEDM=; b=iHCzveXQmDV0zvg6HWoiNu4PI3BCnn+CyijSFMCQ
 yNR/imF0BhjPSk0zRXtsfmizj7CEQAQbGFlmN2GjfZkultGsPHkOIVLRq5sKRENK
 Z033bEmvEd0HyU9MPwBQoZfbQkzovi/Q8buD+TODgWteQszKgIbepDHDZgvn37Zi
 uL0ay/XuT5Q6CTah/7Hvx5FmI/rjIczKWlb0OWLbrnAqJOYliMUaAjSliv8d/hLy
 dL9Bbmj0XG5rtD8ZKz7YXcKgBP3VhR3w1EG4Jn4pI1QXDWvVu5p/dYvHCEeqURR+
 0AP5POt/Z36iTLDI0Y4u1w0o2zE/7xgJJmyCDo04g/xO8A==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwh58pcw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 20 May 2025 21:30:03 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-6f8dd95985dso52797496d6.0
 for <freedreno@lists.freedesktop.org>; Tue, 20 May 2025 14:30:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747776602; x=1748381402;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yp6gS6fiXRKVst4i/0JwkECctK+Yj9KUJFbKtK5dEDM=;
 b=pDSfNH85llGYK3OUev8mXNShsdMmadSa850YKttnrUhqGu0DpcjlfsX+xOXGH7TDke
 Ob70U95QYbW7MPRyl1BkoFYQhk/l3e9flD36+LRCw6HcnLl59JtQrbd6RVluiUX58SqF
 3c4AiPX9e2GuX2OiPX+zrIUg3sBMGMo0TvwdTKeIqSJ+2oodQ0WHybTtQJgibATVR8ti
 zmvHvUjNLJdw2JZdKfPGvS6VMGqQyHOfxLpOh+BtGuQ0zv/cYUFXeCXBnglGHgi/wu17
 XCjJ9oq2EnITGZyNv2i34UJS0AkCbaiR8Tl9w8f3at5AveQC+lFyC6fpJpcT5cWQPBHm
 8zSQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWqB0IgUxrfuSDfv+2VYqpBUeilqE5SpBAoeH7LHom8MXLNIW4HmKrRqwGQxS0FuMqp7m4W+vsSo0o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwLpP7p+KvK7841staAn8jsykSrj+HAx04/gCy757irj+qTnJ9D
 BQ8a8tJx/fHoSppOqjoibITfr9W042nWPnTYYMMvN8cxS5imT4Dv0G9jXfcdMyAOJgulJrw8pJR
 WfJZkMjIRMXOyWKB9ztSo8dI0kKhmQ+qnAWE8XUl+tx1Ax5cKrUTi+AGVkN46f27NNN1lEw4=
X-Gm-Gg: ASbGncvAm+S1xGU9RWqNlXY0IO00vUJFnS0+1rNLxBOAxLFopGc/7TJ9bPx/95cowAZ
 uPL2IN3xuUjStM1ygVbNhph9ymaj8jEeKG9yBtpsBJ//+MD8EPe3tBXEKSFeKDSY5+ct23Cjm+P
 B/v+Eu0kMxZx/Ih3uvn8RqVsS0SWkcvHR13f37FyShLPxWBS7zJa2cxw+zG0tgGR7qNQIPvkaKm
 chKFr0MTymrZ8B+8PuI9HRffScxInfMZmtPYrbiuQ/1Q4kbs+r58ol4rLsHo4pmWOl/I1rQbvWe
 OixXjy5qk7hb0FJXExi/Xa9DzPL9VQ4bzvQUlCDluwO2Z7RwmprZ82pDaiYHPCkAuP7lnp8ikgc
 =
X-Received: by 2002:a0c:fb48:0:b0:6f8:aba5:ed67 with SMTP id
 6a1803df08f44-6f8b2d0fcf6mr190470476d6.30.1747776602228; 
 Tue, 20 May 2025 14:30:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHRHg3BPZjY/B10Mp1qFG51/Xus8QH5zLJpu0aZ2V7CVv1GX6G3h/VmPHQU5N4wG981wP+NUA==
X-Received: by 2002:a0c:fb48:0:b0:6f8:aba5:ed67 with SMTP id
 6a1803df08f44-6f8b2d0fcf6mr190470206d6.30.1747776601801; 
 Tue, 20 May 2025 14:30:01 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-551fc7d8a77sm582050e87.186.2025.05.20.14.29.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 May 2025 14:30:00 -0700 (PDT)
Date: Wed, 21 May 2025 00:29:58 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 09/30] drm/msm/dpu: get rid of DPU_CTL_ACTIVE_CFG
Message-ID: <w3i22a7magzaseje3j7o4qjvkxeslj7wm2uhdcn3o3nrotsrzs@gzdgfrl55qsz>
References: <20250519-dpu-drop-features-v4-0-6c5e88e31383@oss.qualcomm.com>
 <20250519-dpu-drop-features-v4-9-6c5e88e31383@oss.qualcomm.com>
 <f6a10e14-de53-43e1-a887-4a4ba4aa0d63@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f6a10e14-de53-43e1-a887-4a4ba4aa0d63@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDE3MyBTYWx0ZWRfX6BXEhJW9DuQh
 +rDBiAeEdcaIe1YNfVPdrI2RasrblQrQ3RpPZgWED7zrAXoQcJBHGDWTFiHCTw2cy+BxLwGRqnT
 Deh0pa/SzsBnIQHcHYJsR0yQK4V4CgbrokF6NBvTIfch3mbpyQi0bynRlQU86wUggmDtJhmglEg
 Vd96jYrbUPSo84NmWQtEDv6HKa+wpLDgZ+4YfbYGcm5n5+3dx/MXo9JJRPLB8dcapr/5l4gicp5
 49NllH04/NhAZIMTOdy0wMRS/oFtHI613V21kLOfN/afQo7rkAvbUxBlmPTi12+PMS6z6DlT5kO
 ntyGFB+1fmpZBn5IHkahVoF8teLN+X9hvJMV3gJxm2so42wWwlRYa9cSdc29B+yhw/de2qKP22l
 jBpK9i4uFiLurhJMp0CdfWtBSJDVjy2SfdQnV3kdJ3VFSl+xIbObCv1AJUn1KG0Prsj6BreR
X-Authority-Analysis: v=2.4 cv=XeWJzJ55 c=1 sm=1 tr=0 ts=682cf45b cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=2NsQiy_ISMybaogD8ncA:9 a=CjuIK1q_8ugA:10 a=OIgjcC2v60KrkQgK7BGD:22
 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: iYjHD4Mj6Xjw86l3Xmwb99MNC0aepYEG
X-Proofpoint-ORIG-GUID: iYjHD4Mj6Xjw86l3Xmwb99MNC0aepYEG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_09,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 mlxlogscore=999 mlxscore=0 bulkscore=0 spamscore=0
 suspectscore=0 impostorscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505200173
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

On Tue, May 20, 2025 at 09:57:38AM +0200, neil.armstrong@linaro.org wrote:
> On 19/05/2025 18:04, Dmitry Baryshkov wrote:
> > From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > 
> > Continue migration to the MDSS-revision based checks and replace
> > DPU_CTL_ACTIVE_CFG feature bit with the core_major_ver >= 5 check.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h  | 6 ------
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h | 6 ------
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h  | 6 ------
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h  | 6 ------
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h  | 6 ------
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h  | 6 ------
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h  | 3 ---
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h  | 1 -
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h  | 4 ----
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h | 1 -
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h  | 1 -
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c    | 2 +-
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c    | 2 +-
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c     | 7 ++-----
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c          | 3 +--
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h          | 1 -
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c              | 2 +-
> >   17 files changed, 6 insertions(+), 57 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> > index a0ba55ab3c894c200225fe48ec6214ae4135d059..25ba5d9bfff2b3f7a5054ae26511d05917f72d8b 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> > @@ -69,7 +69,7 @@ static void _dpu_encoder_phys_cmd_update_intf_cfg(
> >   	ctl->ops.setup_intf_cfg(ctl, &intf_cfg);
> >   	/* setup which pp blk will connect to this intf */
> > -	if (test_bit(DPU_CTL_ACTIVE_CFG, &ctl->caps->features) && phys_enc->hw_intf->ops.bind_pingpong_blk)
> > +	if (phys_enc->hw_intf->ops.bind_pingpong_blk)
> 
> Why did you drop the version test here ?

bind_pingpong_blk is only available since DPU 5.x, the same set of
hardware as the DPU having DPU_CTL_ACTIVE_CFG.


-- 
With best wishes
Dmitry
