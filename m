Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 675A3C21A7D
	for <lists+freedreno@lfdr.de>; Thu, 30 Oct 2025 19:05:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38BFD10E31D;
	Thu, 30 Oct 2025 18:05:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Gx8gZ6Hq";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YBPQIY/L";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D429510E323
 for <freedreno@lists.freedesktop.org>; Thu, 30 Oct 2025 18:05:11 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59UC7ULn2623035
 for <freedreno@lists.freedesktop.org>; Thu, 30 Oct 2025 18:05:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=hpNzVsUmvobA7lIT4TbTwiLz
 yOdc/tSke27DY7ldyFQ=; b=Gx8gZ6HqWOMBNy+5o5c1F/H1BM468lUL8C5s7jXF
 ddMnH/KTbqp4wovULa7lxwB/mo+gReXt79A1Me2YtHlMlFJWVAanAXOceF+xDmqD
 8Sb2JHkATKruHEvU/8q1khpclepcXCE6OCpd6Oc/ZEWH07BEdOXA8QVureLjpPaw
 c+FStGuplxeRwgK7gkcwkhma8ma6/fqDq7gl5aTyI4pyab2NkFSGq4Tn8rxwAFWO
 QgWUNHRtJZaRTbXxuLoG1C9mvrR3BmP6hMWncO38YLXqnNSJ3saA95vs3BaVitoR
 gsd1a8HxOYpjvBcLUQPi578hS/xMRDP/wMlkoCdMJ/aDqQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a41fxj7sv-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 30 Oct 2025 18:05:10 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4eba247f3efso27845641cf.1
 for <freedreno@lists.freedesktop.org>; Thu, 30 Oct 2025 11:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1761847510; x=1762452310;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=hpNzVsUmvobA7lIT4TbTwiLzyOdc/tSke27DY7ldyFQ=;
 b=YBPQIY/LZCku60UH+XCdEq7u4tvJ3fDsYM9jR+Z0TAknhQzduWAV9IBxC41hZZh4iY
 QXN7TT8/oathLITv4gFaiLXQRmjympKui+kZd0quChitu3Pfdm12y/CJ4SDBXWPcgoi3
 tAqzg+LdcMq+MultqidNEn8nb7lA/ssU4bNYOSaU7NeQ3tztDzXztvG2xXqjrg1dw7C/
 iPDtgPz9zRgPYG66DKUOpIq9wRnoNx06qBIL38XdLF+5md50oBmB61B735w66sgle927
 9BiiwKCvCQYsP1p7jhtmbbKg1F/8V3QoXYrI968bT+NReORh5D40KojF38XMDMFH1vhT
 4Q+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761847510; x=1762452310;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hpNzVsUmvobA7lIT4TbTwiLzyOdc/tSke27DY7ldyFQ=;
 b=m8Q2VH6V0qRuQWGzF52tSiXlgO8Mh7gqCJE4PIARDagaKqj+kDwktaEvxrLcYjDpMq
 +6uao58fYxlFRjJnVq168rjtwH2RBGzrfJLyvClci57wqAkA4aaKPQawGg0ncDI0rwvs
 +jQFZfrJD2XOvJbHl/BDdAVCHNJ6h/Du+LkNZPgVrQSxNz1dGxSSqyqmeSigYgtU3Phz
 PHgGb4A6AxxOhazm4nK7oI1EU490eOyxHY9dbG9yx4LLDOfNfxSs6wKiPUism3a3QcNG
 eiEEeQ3FN6nPHjuZsLZioT8FEoOX8orGrUb80hM5mhZ9UsyPJhtNaw1NFoGXnS0/PGtC
 s7VA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUMGqcPtfEExgc5J7kVh0poHpr7gaaUorI3zrFMulCIe+jOwgVvlL+04zTysW45MdMAkD6Dmn+CjZc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyp0+EJWeITGORJZ0XVCkbRDM3g7B68aUs4BioqIUrfp9IIDUQ5
 AAvY+yjQScNLEHl7mPlaPXRM4/WRfVbVM6ENxVGBrclTaVjnMYgNIIrt9NF7lhh+yIDm7FC7qEj
 ZpVwnVXNu+Ffy4go5ybOMZw8cFFqX/3hwaxtZ5G/iiIb1K6Cxd+zPa2WBbmBwNIYU42uB22o=
X-Gm-Gg: ASbGncsCMvPfkwHnvG+qNZ7CqnANw3G54gDQkgMlW+yEN0N8pXzfaXTyk8vBj4eWU5b
 IbAHvVM1dck672hyYv9kwbGbfYlT3+HAdVgHr/ys0TIgXtOcu5g7+BKbkw/IpAwUC2wbUEjAnf3
 aMAXg6YruOzzdNxwROWdxMqosAfgAClC/7yGzrn4ZWUkC5xgXZjM2tIwb/mLH/GutVz+LHmXC/E
 E+MqPYT07V0nWRrftzHUI6jD7iYhp5P3s5qDH0mAp52wqLXUYMJcRAP0lYuUNWOY+HRvLGON9aI
 oWl3daxjM9cU30tTlarEFktq7SRn9O1ULBkwYAeeuwmz7sHhaXc4aKRyUnDwsSJ6bUlREzNMgPw
 0xRRLsUzVCiIsckqV9+aRL6DzkodVJzLXZ1TWu8Oug2CvRzJGq0tbpEVskbx6hDSkwLVLshZpUx
 wKijEe9G/t020m
X-Received: by 2002:a05:622a:1aa4:b0:4e8:9596:ee6d with SMTP id
 d75a77b69052e-4ed30e159f8mr7797381cf.9.1761847509921; 
 Thu, 30 Oct 2025 11:05:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IElDt9l0NR9/vDPiU5LTv+UBt4T29PKNjIh11r0yOe2hphXbziVzZPIVwEal2E9S0jpWwC89Q==
X-Received: by 2002:a05:622a:1aa4:b0:4e8:9596:ee6d with SMTP id
 d75a77b69052e-4ed30e159f8mr7796561cf.9.1761847509253; 
 Thu, 30 Oct 2025 11:05:09 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59301f50a6fsm4714062e87.35.2025.10.30.11.05.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Oct 2025 11:05:08 -0700 (PDT)
Date: Thu, 30 Oct 2025 20:05:06 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: yuanjiey <yuanjie.yang@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, robin.clark@oss.qualcomm.com,
 lumag@kernel.org, abhinav.kumar@linux.dev, sean@poorly.run,
 marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, quic_mkrishn@quicinc.com, jonathan@marek.ca,
 quic_khsieh@quicinc.com, neil.armstrong@linaro.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
 aiqun.yu@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com
Subject: Re: [PATCH 08/12] arm64: defconfig: Enable NT37801 DSI panel driver
Message-ID: <g5oia3ndlitxrquptsvalfesjujjtlfh7gvrao4vf7vqaqzxvo@5q3bwz7ubmrb>
References: <20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com>
 <20251023080609.1212-1-yuanjie.yang@oss.qualcomm.com>
 <20251023080609.1212-3-yuanjie.yang@oss.qualcomm.com>
 <wuh7agcgg6spghilnx4amqukaaydj25u7kbdiod7fl6pu2ulvm@pmosyuo43cyw>
 <aQF98RvLuOlJZlFi@yuanjiey.ap.qualcomm.com>
 <38c8e26c-08a4-42d9-8f6d-93969af90d50@kernel.org>
 <aQLOaI3ngjswi7kd@yuanjiey.ap.qualcomm.com>
 <7c1e0cb5-2483-4efa-be52-84cbe5d1a4b2@kernel.org>
 <aQMOz4P2/WyjXy1b@yuanjiey.ap.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aQMOz4P2/WyjXy1b@yuanjiey.ap.qualcomm.com>
X-Proofpoint-GUID: SRn_zJdApOc5IqjDqR9RcAAIzlZVeHuy
X-Authority-Analysis: v=2.4 cv=UJrQ3Sfy c=1 sm=1 tr=0 ts=6903a8d6 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=59EQD5k8VZCOn1K0OjEA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-ORIG-GUID: SRn_zJdApOc5IqjDqR9RcAAIzlZVeHuy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDE1MCBTYWx0ZWRfXxy/zO8TUe+gj
 UJFQxz3RXt3IeHUmE3TzCc5TvxxhqEOoKEJY0ggIFUhhslOzAI91FLf7l8W2aeNQk/dEyDDNwW+
 Glp3S3+ToS/NwVpmj6+lIES4x1eO13PiA8pflIpJ2AZGwHNOeoMdjsheC1Db0NgmH8u44yJkl5N
 FsgMwfWhoIJHpp/U1/jMgoZXHnEkIyvLnGlR0bB4HJUXlPZrlJ4Avyy0gJ3cvZSSh41UTKwBT27
 2UpmlmJzEC+MPLBQDOnzTZTNS340i+L/DFpmRoczf51kWTAcc/VhVDE/XnaI53NKsT37fLOVKA0
 +aHG5Z1Aa4YvNWRU6qgb5vvWReLz8b6V/kJgp24zm1AwPGNXLVkgkTkhm+meuevomNbO7u6oI4/
 +r1fu5+KaXFcQqsjeFln/kYrgzGoMQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_06,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 spamscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2510300150
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

On Thu, Oct 30, 2025 at 03:07:59PM +0800, yuanjiey wrote:
> On Thu, Oct 30, 2025 at 06:37:40AM +0100, Krzysztof Kozlowski wrote:
> > On 30/10/2025 03:33, yuanjiey wrote:
> > > On Wed, Oct 29, 2025 at 02:05:20PM +0100, Krzysztof Kozlowski wrote:
> > >> On 29/10/2025 03:37, yuanjiey wrote:
> > >>> On Mon, Oct 27, 2025 at 10:51:23PM -0500, Bjorn Andersson wrote:
> > >>>> On Thu, Oct 23, 2025 at 04:06:05PM +0800, yuanjie yang wrote:
> > >>>>> From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > >>>>>
> > >>>>> Build the NT37801 DSI panel driver as module.
> > >>>>>
> > >>>>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > >>>>> Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > >>>>
> > >>>> You (Yuanjie) authored the patch, but forgot to sign-off, then Yongxing
> > >>>> provided certificate of origin, then you provide certificate of origin
> > >>>> and send it to list?
> > >>>>
> > >>>> Please correct.
> > >>>
> > >>> All the display patches were jointly developed by Yongxing and me.
> > >>> So every patch 
> > >>
> > >>
> > >> So two people were working on this absolutely trivial defconfig change?
> > >> I have troubles believing this.
> > > I want to say these patches I am first author and yongxing give me support, so
> > > I think yongxing is second author.
> > > 
> > > I want to express my gratitude for Yongxing's support in every patch, so I included
> > > both our names in the sign-off for each one.
> > > 
> > > However, if my intention causes any trouble for maintainer, I can remove Yongxing's
> > > sign-off from this patch.
> > 
> > 
> > Please read submitting patches to understand what Signed-off-by means.
> > Otherwise I have doubts we can accept your patches - you simply do not
> > understand what you are certifying.
> Thanks for your tips, and I learn some tips from submitting patches: 
> https://elixir.bootlin.com/linux/v6.18-rc3/source/Documentation/process/submitting-patches.rst#L524
> 
> I thinks below sign should be true, if you also think it true, I will use it in next patches.
> 
>  Co-developed-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>  Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>  Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>

Does one-liner need two engineers to co-develop it?

-- 
With best wishes
Dmitry
