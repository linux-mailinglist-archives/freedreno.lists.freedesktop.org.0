Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66EFAB34B49
	for <lists+freedreno@lfdr.de>; Mon, 25 Aug 2025 22:00:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B5E110E550;
	Mon, 25 Aug 2025 20:00:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="cjlo3I6k";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B936310E550
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 20:00:04 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57PFm3Ts004580
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 20:00:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 QpMXjjOloTbOcv7VKi87DER32XX876zK5UxtTO2ua/w=; b=cjlo3I6kOhBPZA0p
 cSlGSa5xmLkswO5obuRr3lT6JCUurIBNg29AZt1dNny5CZcBaCf76N4y2nuELyXf
 ncRqJZeHIPP5OcEcaqOMOJYxu/au6gGmi/qrz6pXyz97bbkWG5tLYmRs/XeiF+yD
 jTVcBDyJLiedm65n8oeOgMwmma2GdCDn2L3XAa1xrrUMtfdgOIo8jzytvoZ0xPSe
 3zOrnvWB0JqyUALi0IcShbU8z5qgIs8jonUFjLPaq7uNGFHGz++Aqzqhla827Nbc
 y2L+7qzuNqSvXmUm7IfSuGfmSBEIXVfB1drY7hXAnmBqR+AHxrx30Ia8vLPriTww
 heiRVg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5um6dda-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 19:59:56 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-70d9eb2e971so63725766d6.2
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 12:59:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756151986; x=1756756786;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QpMXjjOloTbOcv7VKi87DER32XX876zK5UxtTO2ua/w=;
 b=GZVXOI99ynKyQE/07JfDoxcCcdP8XRLxUCrbxerIYD7H4+5TEEKhUZFbA5rwOujH/h
 LCqPnKIJbGa3cvXbphQxedPLU1VaTpOQagAuwri+umFjKcCN8T57ffI0xOVf4dmYihqr
 G6n3NHmCmZ4ccTKv5Ky9ZOvRsdcBT9DwTan1Zd5wU5PCNZtB0p7VRecuIWf7wOrlg/+F
 5qA4ccNNCKN3AW5BUmUfR1LupNEC/PS+lYVQ3FRpKcxBI8Et/ZDdoZzRfnZEqieZW3x8
 i4yxZjgqqCeEXDYwLujf+7Egxycl2sTbBoHqk0Tu4Yd0VX9+d2L18fjwJCJmYeOIH24d
 Higg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWFWdRwJSrfvXxzYKK9zjrtLiJritiKSSWUP+dSIe1R60tEnRsqo8nhXeqX90SBm3ahtJ8r1x71s20=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz5VZ7BiLyBxUSZm4aPfxvZh+SewIqJPXxEc8vyHca/bKNgo7x+
 Fmp4jMABqVD8UlLgmKF+S1/0Ql5RmS/PuyTAiKBYSOUR6ctW+CRPza5WBqhq116DYqlNQ2k5oYZ
 MtPmgsFDwD+s0NLo1cTjiDSJ/DsArahEqIKkEQ3qZyjITW4hdLKCQYY7PR+UhqEqmUkg2nnw=
X-Gm-Gg: ASbGncskWV045gp39JqAc+t1pynk8+nLk8LPa5DMpnCBHmkJq6nsrTBunEYmwkFCRZF
 g7l/9CYai41HqIWyp+32Cr/i4ELxUoFUnrJe1xSHurhKBoJnSCQ1Y+7ymtaaXgn/nij+d8ZbYKa
 CfaoehF4EMdCUT6ePFHTHYwBU4JO9Jld9ALpCm+3f0rCHcaFKYUpU9kgoeygTymj20iLO/+8Gvb
 PfWssUKYeHbc3S37vfEMufIG2j/SPBYCeqTkW5/ks0xT7QhKkVTDd/J9WT83y+tEm92TBaDx+Zv
 NoGHLYNxdkyE6S0A0D/uy2Hsuu+52OANUeFMuHQ/bm2f62eRSWfwgh7iW5BS83uwOQdt6eqYETs
 v+DTzpBau5lnBtqjQNFAwotz+r3INN2k0P2SK9UG3bXvWAywV3OfH
X-Received: by 2002:ad4:5de9:0:b0:70d:ac6c:d5e with SMTP id
 6a1803df08f44-70dac6c152cmr97978696d6.17.1756151986341; 
 Mon, 25 Aug 2025 12:59:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEQJCEWzdMqyTuDrQVNON3NoBMK6mCKwkSCCF09YR8Rv+ULva4lyyz7WmxFpfIfcvr79oPndg==
X-Received: by 2002:ad4:5de9:0:b0:70d:ac6c:d5e with SMTP id
 6a1803df08f44-70dac6c152cmr97978436d6.17.1756151985824; 
 Mon, 25 Aug 2025 12:59:45 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3365e2687acsm17787781fa.32.2025.08.25.12.59.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Aug 2025 12:59:45 -0700 (PDT)
Date: Mon, 25 Aug 2025 22:59:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <rob.clark@oss.qualcomm.com>
Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Alex Robinson <alex@ironrobin.net>, lumag@kernel.org,
 abhinav.kumar@linux.dev, jessica.zhang@oss.qualcomm.com,
 sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
 simona@ffwll.ch, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm: fix race in Adreno header generation
Message-ID: <7w522k6vkngqw2tfbmrhuvxxcdlby3wwzueaqw75pxud2y7puw@2rjhjl5ikn6c>
References: <20250823020919.9947-1-alex@ironrobin.net>
 <6sdzghcc4uynvmk6r4axpwgqlmgxqzi457ttedqlrql7f7lt47@glsrzu46a63x>
 <CACSVV01R=FPAErpfJJvESKig+Z8=amEkpf6QFnkXHhTjFsPf5g@mail.gmail.com>
 <5a405510-3eec-4262-9855-483dd589d8dc@oss.qualcomm.com>
 <CACSVV03y1s+EdkNm0nWFL7yuR8y=YuBs-OJaKquOh4izwKc_nA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACSVV03y1s+EdkNm0nWFL7yuR8y=YuBs-OJaKquOh4izwKc_nA@mail.gmail.com>
X-Authority-Analysis: v=2.4 cv=VtIjA/2n c=1 sm=1 tr=0 ts=68acc0bc cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=foaXouvCAAAA:8 a=ogmizbzjsSRwc_UF5_MA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
 a=lBkOZJTZZNyIbKe29SIT:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMiBTYWx0ZWRfX1EwGfOMzw3YJ
 7PoTGCT/yNyhV0kFF4J/way3U7Jgz8azriJiCrgqKqy3lNfcDdmpoqRHHR3sPPkJWnmZbpwrHy8
 Lkh8lBC9yyT6C3W3A5E/Kbja39xpQPhw5wajVdxa4Lfk9nrgbxqu2OgkCsI70nPXBya+wM64eSp
 LO21DA/xmqbu7KvvaLyh/OxcspJRu3R4/eamJSs5KJPmLUAywLsIhXnBEj8O1/y3o47ZTv31GgK
 Z/CY4mLD5V3EDr3ZJnnUuUmT/fOtSb9FE7x3LhjAxaC4lc5K52IVWEhCSNreWuuje7rYrPtHWHx
 TofiAJ7J0nAZu6iao0Z2jiAXs8X+pOEv3h7mqPTfxIWrJM+6grDQfw9diNQRc76LplTKseyxQ7s
 CjVo3PbJ
X-Proofpoint-GUID: zmm-ecwgQLsXZW0rBwDg9ueKP-ZHaif4
X-Proofpoint-ORIG-GUID: zmm-ecwgQLsXZW0rBwDg9ueKP-ZHaif4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_09,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 adultscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508230032
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

On Mon, Aug 25, 2025 at 10:48:06AM -0700, Rob Clark wrote:
> On Mon, Aug 25, 2025 at 9:23 AM Akhil P Oommen <akhilpo@oss.qualcomm.com> wrote:
> >
> > On 8/23/2025 7:46 PM, Rob Clark wrote:
> > > On Sat, Aug 23, 2025 at 6:49 AM Dmitry Baryshkov
> > > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > >>
> > >> On Sat, Aug 23, 2025 at 02:09:39AM +0000, Alex Robinson wrote:
> > >>> Builds can compile msm-y objects (e.g. msm_gpu_devfreq.o)
> > >>> before adreno_common.xml.h is generated in trees that generate Adreno
> > >>> headers at build time. Make msm-y depend on the generated headers,
> > >>> removing the race.
> > >>>
> > >>> Signed-off-by: Alex Robinson <alex@ironrobin.net>
> > >>> ---
> > >>>  drivers/gpu/drm/msm/Makefile | 1 +
> > >>>  1 file changed, 1 insertion(+)
> > >>>
> > >>> diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
> > >>> index 0c0dfb25f01b..1a918d44ac48 100644
> > >>> --- a/drivers/gpu/drm/msm/Makefile
> > >>> +++ b/drivers/gpu/drm/msm/Makefile
> > >>> @@ -221,6 +221,7 @@ DISPLAY_HEADERS = \
> > >>>       generated/sfpb.xml.h
> > >>>
> > >>>  $(addprefix $(obj)/,$(adreno-y)): $(addprefix $(obj)/,$(ADRENO_HEADERS))
> > >>> +$(addprefix $(obj)/,$(msm-y)): $(addprefix $(obj)/,$(ADRENO_HEADERS))
> > >>
> > >> I'd say, no. The idea was that msm-y should not depend on
> > >> ADRENO_HEADERS. If there is any dependency, please move it to adreno-y.
> > >
> > > probably we should s/adreno/gpu/ and move all the msm_gpu*.* there..
> > >
> > > In the mean time, I think we were going to drop this patch from the IFPC series
> >
> > Yeah. I will drop that patch.
> >
> > Btw, was my usage of adreno_gpu symbol in msm_gpu* files incorrect?
> 
> I suppose _technically_ it is, but the split btwn msm_gpu and adreno
> really only made sense for a2xx, and only if we tried to upstream the
> old 2d core, which never happened

Granted that there seem to be nobody interested in OpenVG anymore, I
suggest we forget that Z180 existed. I think it would be wise to
simplify things for the GPU cores (merging more of the msm_gpu_* into
adreno/).

-- 
With best wishes
Dmitry
