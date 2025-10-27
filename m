Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D46AC0D7B6
	for <lists+freedreno@lfdr.de>; Mon, 27 Oct 2025 13:22:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F277C10E464;
	Mon, 27 Oct 2025 12:22:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="mBs6Fgk9";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC2C610E464
 for <freedreno@lists.freedesktop.org>; Mon, 27 Oct 2025 12:22:10 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59R8SqiC875619
 for <freedreno@lists.freedesktop.org>; Mon, 27 Oct 2025 12:22:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=Psg+67BfDLKR1waGwn5a3FoQ
 zpaxCzLH0+T9U8DBvbg=; b=mBs6Fgk95ffbn4ieruXYrS9Ov7pW4DuApfupuktD
 bX+M9/sG7KIZXUhn+qqhj100+ee+Iv5KD2GbjThnS4Yhp53XXfxDuex4rPALtaIj
 Fcpz1NKhX3QA1O75SAhUAC1YG399L0jTTLEXYrBLQ4XQGFwktwrkPkKVQrsF6vkA
 gzXRTmfqrUQvFbCLXpbqm5K//BKz0vLluu/2Srtx/T1Bin3VOpkZGJRg+5u1Mgv2
 hXcpprUqVZT4lrMiXbNwjpCWqxOHJwO6pS5wDPUIYgF7a2A/lQq/U4jFsGqEUitM
 oAte68UO9chMnRCUZy5W/CTreeeuHk3HxAiuT5CutnrrGQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a1ud1swqs-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 27 Oct 2025 12:22:10 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4eba247f3efso53610981cf.1
 for <freedreno@lists.freedesktop.org>; Mon, 27 Oct 2025 05:22:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761567729; x=1762172529;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Psg+67BfDLKR1waGwn5a3FoQzpaxCzLH0+T9U8DBvbg=;
 b=dcTvjYLRvgk3rVctuwMU7REx1vPFELoc0Fu7MwnIIyv0MIRt7W6utQkovNV+eXnuI+
 01s9R0PCKNY5OeVyUUOW2Mv0aRPW+cJWtmJ1CKLY1T1tTdaA2p/x3JAw5RPvxR2urZp5
 FS61rxBSB0vlbTR9Z6jyMbOoVXETM3PN19Q3EGVbPMzWS67GLxvCZrxrijLhGiJ9POM4
 S6I4hGzE/Ml3G+H8q9JXc6dvR+nkU+NpxGUSDf0V6VBYZwUo2vk6mmLTW0kin9wliHil
 wpRvhdIvORtopJJ07cF7jgl8Afhqsm3cKeuCS6/uEaJaWJAn0Nupws5fv1Bo2J7ckkki
 5rCg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX/Eizrtf/XzmXde8FsfseBrODj4dt9KHIkbi1/W1aqQnzxlRXjhiSOHZDv5ujLVF/4Is+sD2R19Gg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yys4x/g/rZDDGAKgOKUgDQhQgMgYo6dLbOH59EDJX01w7oSXV7+
 oiLXuxglzuyw6SKme/yf5GrYfLQE8SUJxiMg/l8zCs9kH8svKcsjGRc+psHzll47HOPGn2z3Mh5
 0ciMEh4GpOaP25gMl1IWZ4/+dZsWG7yiS0MhOrDUbK6IyybdKgd1oSBEdvLaA7sWghjyj8qg=
X-Gm-Gg: ASbGncuPbE2Zc28z0GBozy48i2qUjA7fiknYv6NOy+TOnEe+xO8cZctgCwEJS1+p6nX
 ZbAPKCzm+vsSLef4Fjayx3L48mlzBbC8Of/JY0Y9JDxUNOKboqC3xC3WSCrn8++HYEnotHpbSSe
 x7UCabgmjK9NK20XOsSX6ktckqOcwe5KLDNnDdzEuBzP0zNPRuqMn8oMSyI1jEaSsBBa/rL/fG6
 kekIQx61eI+s8jg9vdRIndJ2xfznxzj1UivzLDQBFovwu4f088O0Z3SFTyH73jaOiawTwvTcvLg
 6m56643dM3dJzP8n+UsxzXyILseYeZYymEFLBv25divx9Bxb+tWr3s+ayQkh4NkRJqAgWwDMmIW
 UZE3qcFNnNuvC9958zz7TnG0zDnENLt3qZ57SEi5d/PG3kpCMxPFyAUWv0uzr4XhYK0+n/+DJZY
 VzC5Iv6BY6uKWY
X-Received: by 2002:a05:622a:2291:b0:4ec:f017:9e2c with SMTP id
 d75a77b69052e-4ecf017a075mr61636291cf.35.1761567728739; 
 Mon, 27 Oct 2025 05:22:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEGYgD/La2Tib5FQl2fihboVZ7Zt1I5VSs9oXv2jbhiaDS8YaEpcF2SppZieSQXcjQmVktSMA==
X-Received: by 2002:a05:622a:2291:b0:4ec:f017:9e2c with SMTP id
 d75a77b69052e-4ecf017a075mr61634961cf.35.1761567727214; 
 Mon, 27 Oct 2025 05:22:07 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-378ee0c342csm19672521fa.26.2025.10.27.05.22.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Oct 2025 05:22:06 -0700 (PDT)
Date: Mon, 27 Oct 2025 14:22:04 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: yuanjiey <yuanjie.yang@oss.qualcomm.com>
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
Message-ID: <4bnvh2ydtrmejknzpsxoalxoyjpq5g5cjbrico5ezbek24r52s@u5zy6ekh6lps>
References: <20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com>
 <20251023080609.1212-1-yuanjie.yang@oss.qualcomm.com>
 <20251023080609.1212-2-yuanjie.yang@oss.qualcomm.com>
 <zxofh6bwee3vjjlntlfqy7yg2iu2mipjvl7s5bcm6gbh233cjq@nuicjojawd2d>
 <aPsWEhM7i+gDjXE0@yuanjiey.ap.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aPsWEhM7i+gDjXE0@yuanjiey.ap.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI3MDExNSBTYWx0ZWRfX8J/WG7zKS2p9
 y3VMirjqPEqqgl6++2HDCjLFU6EM8njQR6EpOTdlAM7GVlPzTySA8uOi4yKM1qY8Cyg8rwNLOK/
 oT+TCszOppuZ2MlvjiB6402363ljkdcbAVgVmeBGdj/z+iE94zrzmj5Svx2Xj/E0QWYp1lEspdA
 GQxjwoKxJE9hAACgh+n4OanXJLZ0pthNd1VfqKLxjfeCSrastqFMOOU+GSpOj9EjbAyTXZSmN0l
 IM5yWk/M+xCoVlGFrPHx0JMS7GeGihHz6JFcA49UDim0D72qwXpzJuWlH4CgrUQB7OM9bpR+JY3
 06Bhyi5eYOAFxnj+bh73nV6c92z3hYFshbtRaImT3zPEo8OFKSRZeRsguCSjdQ3xNWBXWrK6hOL
 0ZoHvnlwHGvqMHRjHXx2BUU87CfFzA==
X-Proofpoint-GUID: HhnK8W59nQ3uy4gkZa7CTDfaUcVXS8xZ
X-Proofpoint-ORIG-GUID: HhnK8W59nQ3uy4gkZa7CTDfaUcVXS8xZ
X-Authority-Analysis: v=2.4 cv=UqNu9uwB c=1 sm=1 tr=0 ts=68ff63f2 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8
 a=UzKOEE2XrYQWi1Oh8k0A:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-27_05,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510020000
 definitions=main-2510270115
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

On Fri, Oct 24, 2025 at 02:00:50PM +0800, yuanjiey wrote:
> On Thu, Oct 23, 2025 at 03:14:38PM +0300, Dmitry Baryshkov wrote:
> > On Thu, Oct 23, 2025 at 04:06:04PM +0800, yuanjie yang wrote:
> > > From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > > 
> > > The NT37801 Sepc V1.0 chapter "5.7.1 Power On Sequence" states
> > > VDDI=1.65V~1.95V, so set sufficient voltage for panel nt37801.
> > > 
> > > Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > > Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > > ---
> > >  drivers/gpu/drm/panel/panel-novatek-nt37801.c | 5 +++++
> > >  1 file changed, 5 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/panel/panel-novatek-nt37801.c b/drivers/gpu/drm/panel/panel-novatek-nt37801.c
> > > index d6a37d7e0cc6..7eda16e0c1f9 100644
> > > --- a/drivers/gpu/drm/panel/panel-novatek-nt37801.c
> > > +++ b/drivers/gpu/drm/panel/panel-novatek-nt37801.c
> > > @@ -267,6 +267,11 @@ static int novatek_nt37801_probe(struct mipi_dsi_device *dsi)
> > >  	if (ret < 0)
> > >  		return ret;
> > >  
> > > +	ret = regulator_set_voltage(ctx->supplies[0].consumer,
> > > +				    1650000, 1950000);
> > 
> > This should be done in the DT. Limit the voltage per the user.
> Two reason:
> 1.
> I see https://patchwork.freedesktop.org/patch/354612/
> 
> panel panel-novatek-nt35510.c also use regulator_set_voltage set right voltage,
> so I do the same work.

Please look for the majority rather than the exceptions. Out of all
panel drivers only two set the voltage directly.

> 
> 2.     Kaanapali vddio regulator:
> 
> 		vreg_l12b_1p8: ldo12 {
> 			regulator-name = "vreg_l12b_1p8";
> 			regulator-min-microvolt = <1200000>;
> 			regulator-max-microvolt = <1800000>;
> 
> 	Voltage is from 1.2~.1.8 V , So I can not set it 1.65~1.95 V from DT(1.95V is beyond the allowed range).
> 	So I use regulator_set_voltage to set voltage, and regulator_set_voltage will choose the appropriate voltage.

DT has to list the voltage values that work for the devices on that
particular platform. So, ldo12 should be listing 1.64 - 1.8 V.

> 
> 
> Thanks,
> Yuanjie
> 
> > > +	if (ret < 0)
> > > +		return ret;
> > > +
> > >  	ctx->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
> > >  	if (IS_ERR(ctx->reset_gpio))
> > >  		return dev_err_probe(dev, PTR_ERR(ctx->reset_gpio),
> > > -- 
> > > 2.34.1
> > > 
> > 
> > -- 
> > With best wishes
> > Dmitry

-- 
With best wishes
Dmitry
