Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5600C17F52
	for <lists+freedreno@lfdr.de>; Wed, 29 Oct 2025 02:58:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 923FF10E094;
	Wed, 29 Oct 2025 01:58:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="gk1piDNa";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K91QwgBe";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F2EC10E094
 for <freedreno@lists.freedesktop.org>; Wed, 29 Oct 2025 01:58:53 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59SJqhnE2511166
 for <freedreno@lists.freedesktop.org>; Wed, 29 Oct 2025 01:58:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=9IavgnA3wJTsxViY9YsmCRsi
 9l8lOQx14IrwVBYaXOw=; b=gk1piDNaqjcYc7khLjvcbaS3hQHEM6gNLW0sgkjQ
 pasEx8zmvJnuk6HqMuOaPVxkCCwvLT3nAHjchhn6d7OeZFmC+4c/nzPUZH/V//PY
 3s0R5jL/IFziOEw/YsxMufZ53+fGOzFfLLrhDlB73vXfW+sKa7+JGCoN6+mvB3tj
 SorUxQqWLkAng9r1RpqT1hhUHgghoDIsKO+4dLnHpaze3FkRzYjswAPRH700LHFv
 uNgotEe2RW/iBh/zWt2yKNJYhNoYJwtE8PFu4wl12UzlDfwdGX1fKuvGmheu0aiy
 4loV4QLCExmB0qnma6zbGv2NqFU+ZD3QCId4xa0dC5lQpg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a34cd8svy-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 29 Oct 2025 01:58:52 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-87df30d45ecso186118676d6.0
 for <freedreno@lists.freedesktop.org>; Tue, 28 Oct 2025 18:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1761703131; x=1762307931;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=9IavgnA3wJTsxViY9YsmCRsi9l8lOQx14IrwVBYaXOw=;
 b=K91QwgBeKbj0v49sugemn1EYLFOrNQdR/1pj8t9JNT14UeU8mm4FSYeQT9f4RnpTBL
 bOndkmteHrD9goL4mbM1fvlOdJRog5Ch9TX4YiUA7JlWgpjVgApVejVvxEXb7hC1MvH9
 Cor1YusmpIm8xYIbajYGKUg2zi88mppGTZ9xjufCXoV5KV2VIZH7exUNV02RRLHPuLko
 mV+gua6Mjjs3NAKTF8/YXcfDrM06OWWijAX1FWe1wUFRXYxbO/kVUx47jabvn/Sy4GG5
 Xb1wS1nKRavvoHvlOH22nwPn1ze/DQ/DQtC2Z4HVvtHfAvAVZv+dTx+tbiNXWcPW9jqw
 /1CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761703131; x=1762307931;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9IavgnA3wJTsxViY9YsmCRsi9l8lOQx14IrwVBYaXOw=;
 b=Mo97nzlyuTq15+G1xcgdAzOhAEkhx7WHDR68ZkGnjYvdYd2wyzjqRsMuR04kGssdOJ
 oAidCyk/rOgB8Dv3tLYIKWiBbuAjRcNfSb1wF8ymmdZELx29rGfbgPcXeKPXeCg3REoM
 OKPpVGfRMPRsuQB1fRHYnVzhU6DnuZDxJxCgPIRk0tqmeRhaEmx+HB0PE7MPXFP3fYf+
 HVzIQOLfOVE50RQ+UxGgOYSzDVy1A/xYP6VEUAqmBPRIMi+HyCc6wKBdjnKTOcjV4ad1
 syFU2GTVH901UI2uqFHO+/RsJhsLoLuKfjIzeEC1J/UP6Hc2YmXPD6fOSuGn0rAhCPSu
 CLGg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXBNhPBytWrQ7N6v3JOVxkABXznjrNZWD/YqRx7s77aoMjvrIn1/IcYyGrP5gD682cQMFJrlcGxf7g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywdb/eMsJG1pd3lgFlfcSN6922nG3wmJPocDLi1rsT5JqmAPArU
 5r4JwEJT0heA4g9CG1sviLGIXJ4BSLC8DkxoseHW47tLk1SbKRYIaZDd8xY2/OdXhENCVD4t5B8
 MOUsqvJGCg+atdPLt19eBqMWTuK29HFBT9XR3VJ4tHhryJ7Mol2WJEYXCtNVnvAIm8NK5bpc=
X-Gm-Gg: ASbGnctNHVjXlQgFbUM/B0ds/wsF+iTxSGMQNTeYWBuAENZX06s+Lq71mVnOfPglvlC
 uC6FRK5mtR8dJh7F5CanTwauH72eXUqjTdJIZzfl+9PTdE9HhIe9Oenf7/QhLkBoOs2VORmKTIL
 6nBxZavYsGa6hq0SwuTGySChiQ5DZfCaptNWJTTd6NE4WjxbnYpKj5qZWqmLXbEzDmLDmVAqLxn
 Z7m1VXODBdLDasBly7WkQ5LXJ1qOcCokpr9K1PeaekLjIYKf0+UtzTTtCiACZa5n1ht1NQ6YLd8
 rUusDi6b5cNRQM1wzpuDkYkH0oOEX0h+95387qb/YRaoQbwlXOlsms8vPtBK2iTUQymn4FPvhSi
 vvuaWsCMg5qRoatq0nEQbHH2ccFzaPLU9KQB9D3iJ5rQb4VigkseUMEnL3bxb9IWJ
X-Received: by 2002:a05:6214:242f:b0:87d:f2e9:488 with SMTP id
 6a1803df08f44-88009acdd94mr15033706d6.11.1761703131490; 
 Tue, 28 Oct 2025 18:58:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGDHmfG0LUjzp2Ek/MezF+lDC26fFhbmOLWFp413US458OqwG2FWmdGE+xxaaQJ07XpmM3Yzg==
X-Received: by 2002:a05:6214:242f:b0:87d:f2e9:488 with SMTP id
 6a1803df08f44-88009acdd94mr15033436d6.11.1761703131057; 
 Tue, 28 Oct 2025 18:58:51 -0700 (PDT)
Received: from yuanjiey.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com.
 [129.46.232.65]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-87fc4944a84sm91522446d6.36.2025.10.28.18.58.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Oct 2025 18:58:50 -0700 (PDT)
Date: Wed, 29 Oct 2025 09:58:39 +0800
From: yuanjiey <yuanjie.yang@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
 sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, quic_mkrishn@quicinc.com, jonathan@marek.ca,
 quic_khsieh@quicinc.com, neil.armstrong@linaro.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
 aiqun.yu@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com
Subject: Re: [PATCH 07/12] drm/panel: Set sufficient voltage for panel nt37801
Message-ID: <aQF0zzUpLeUu4lrC@yuanjiey.ap.qualcomm.com>
References: <20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com>
 <20251023080609.1212-1-yuanjie.yang@oss.qualcomm.com>
 <20251023080609.1212-2-yuanjie.yang@oss.qualcomm.com>
 <zxofh6bwee3vjjlntlfqy7yg2iu2mipjvl7s5bcm6gbh233cjq@nuicjojawd2d>
 <aPsWEhM7i+gDjXE0@yuanjiey.ap.qualcomm.com>
 <4bnvh2ydtrmejknzpsxoalxoyjpq5g5cjbrico5ezbek24r52s@u5zy6ekh6lps>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4bnvh2ydtrmejknzpsxoalxoyjpq5g5cjbrico5ezbek24r52s@u5zy6ekh6lps>
X-Proofpoint-ORIG-GUID: _MsngidPbwNbt783gAfptZ8AeCzqw5a7
X-Proofpoint-GUID: _MsngidPbwNbt783gAfptZ8AeCzqw5a7
X-Authority-Analysis: v=2.4 cv=avi/yCZV c=1 sm=1 tr=0 ts=690174dc cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=kj9zAlcOel0A:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8
 a=RHm5ZmmhJtTlhXRmaf0A:9 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI5MDAxMyBTYWx0ZWRfX5yit3f9P7JjG
 NI8uwsT2R/L8rdZiJma59WhgWaJoK2HUoHxT2aUNeJrzpqVDLJJovmzovvv6hPVSoraq9Vlb9pO
 Bf5zggdgQB1LrcQFRY2TGxFf+BZZsHgwl0U9F3a2iXuNEGj5sxw/iSQ2+NTRKjsuWzBoO6DIWaO
 h1KAOnAvTBFuKiL4E5/igYUqKLs1eTCzmjWiB1GTBgFgfvkHBjVUjqTsg4IU8O2Xo8oDS+slOxS
 rQ9g+4hIVLm6t+ZpQ8ZOgor6KLnx5K4cyIiHqicXERFpaW0coaUNZa8nAqRKWsn6iiujXo2oftx
 Dgwj/e7XPO70lIthc+rs1VK9cAuQ9PDIEufS9I5TP+lj/hIqJoZsWmu8RgWGpzG59CDtQ3DE3uv
 WqHHNjm65JGFrfjZXEUgMhJZ3ABJgg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-29_01,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0
 suspectscore=0 adultscore=0 spamscore=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2510290013
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

On Mon, Oct 27, 2025 at 02:22:04PM +0200, Dmitry Baryshkov wrote:
> On Fri, Oct 24, 2025 at 02:00:50PM +0800, yuanjiey wrote:
> > On Thu, Oct 23, 2025 at 03:14:38PM +0300, Dmitry Baryshkov wrote:
> > > On Thu, Oct 23, 2025 at 04:06:04PM +0800, yuanjie yang wrote:
> > > > From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > > > 
> > > > The NT37801 Sepc V1.0 chapter "5.7.1 Power On Sequence" states
> > > > VDDI=1.65V~1.95V, so set sufficient voltage for panel nt37801.
> > > > 
> > > > Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > > > Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > > > ---
> > > >  drivers/gpu/drm/panel/panel-novatek-nt37801.c | 5 +++++
> > > >  1 file changed, 5 insertions(+)
> > > > 
> > > > diff --git a/drivers/gpu/drm/panel/panel-novatek-nt37801.c b/drivers/gpu/drm/panel/panel-novatek-nt37801.c
> > > > index d6a37d7e0cc6..7eda16e0c1f9 100644
> > > > --- a/drivers/gpu/drm/panel/panel-novatek-nt37801.c
> > > > +++ b/drivers/gpu/drm/panel/panel-novatek-nt37801.c
> > > > @@ -267,6 +267,11 @@ static int novatek_nt37801_probe(struct mipi_dsi_device *dsi)
> > > >  	if (ret < 0)
> > > >  		return ret;
> > > >  
> > > > +	ret = regulator_set_voltage(ctx->supplies[0].consumer,
> > > > +				    1650000, 1950000);
> > > 
> > > This should be done in the DT. Limit the voltage per the user.
> > Two reason:
> > 1.
> > I see https://patchwork.freedesktop.org/patch/354612/
> > 
> > panel panel-novatek-nt35510.c also use regulator_set_voltage set right voltage,
> > so I do the same work.
> 
> Please look for the majority rather than the exceptions. Out of all
> panel drivers only two set the voltage directly.
> 
> > 
> > 2.     Kaanapali vddio regulator:
> > 
> > 		vreg_l12b_1p8: ldo12 {
> > 			regulator-name = "vreg_l12b_1p8";
> > 			regulator-min-microvolt = <1200000>;
> > 			regulator-max-microvolt = <1800000>;
> > 
> > 	Voltage is from 1.2~.1.8 V , So I can not set it 1.65~1.95 V from DT(1.95V is beyond the allowed range).
> > 	So I use regulator_set_voltage to set voltage, and regulator_set_voltage will choose the appropriate voltage.
> 
> DT has to list the voltage values that work for the devices on that
> particular platform. So, ldo12 should be listing 1.64 - 1.8 V.
get it. I check downstream DT,
  dosnstream DT:
   regulator-min-microvolt = <1800000>;
   regulator-max-microvolt = <1800000>;

  I test 1.8V works, So I will add 1.8V in next patch, do you think it is ok?

Thanks,
Yuanjie
 
> > 
> > 
> > Thanks,
> > Yuanjie
> > 
> > > > +	if (ret < 0)
> > > > +		return ret;
> > > > +
> > > >  	ctx->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
> > > >  	if (IS_ERR(ctx->reset_gpio))
> > > >  		return dev_err_probe(dev, PTR_ERR(ctx->reset_gpio),
> > > > -- 
> > > > 2.34.1
> > > > 
> > > 
> > > -- 
> > > With best wishes
> > > Dmitry
> 
> -- 
> With best wishes
> Dmitry
