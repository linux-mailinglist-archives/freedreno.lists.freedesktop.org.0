Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF03EC21996
	for <lists+freedreno@lfdr.de>; Thu, 30 Oct 2025 18:57:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A20BA10E0ED;
	Thu, 30 Oct 2025 17:57:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="SZFgv9BW";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G1UK0atC";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE45D10E089
 for <freedreno@lists.freedesktop.org>; Thu, 30 Oct 2025 17:57:51 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59U9ERZ51994523
 for <freedreno@lists.freedesktop.org>; Thu, 30 Oct 2025 17:57:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=NXUbL/o2sn1wUE5NQyCh4jie
 IT23KtAPiSUqZFn5Wbo=; b=SZFgv9BW01+Hn166INLJytfk9Tc0qrOHMe6Tyjcq
 qw9gpkmTzNDXcgF6jt7V5uEBuxuPa+EpW4Xc+SYUBoXbwRwLKgY4nhGDPgD9EZ6v
 H+VnVuxWrh2TxX1U7ibeqK0/zqvFsPB4oEOMITYkDXKI1j5mzuKEMEY5T+zufsDa
 e1C/nFc7Rq7Z7PGajnE8QoLg038ZxrQ4R0fsazMcOPLjLH5K413XuxJpsm9Rakty
 hk9cabnqq9fwSgMnp0o6HFC6ELn0+Y45mbguGoAeMCg5S+TmwpZokpCwHKRq/Lr0
 y0lmBUPOH/jpu5au6x5iDzEUD/QmP5PALxCV7RcmzM4mUg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a3wr72rw8-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 30 Oct 2025 17:57:50 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4eceefa36d0so30886841cf.1
 for <freedreno@lists.freedesktop.org>; Thu, 30 Oct 2025 10:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1761847070; x=1762451870;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=NXUbL/o2sn1wUE5NQyCh4jieIT23KtAPiSUqZFn5Wbo=;
 b=G1UK0atC+RnQi4m46XZGKP3EcVqMF766Nm/4nVd6n2Whb1Kazffzo1YMFbFgjt3Jh/
 Hq7ztd3bosbmOdNbA9fwr2ZWL1zzhanccw7SvW19cR6U34aQJiXifTufF0NK5LoQjjEO
 PidVT6L0Yfx8ewwPD+tsnfPIrgazQHoXmk4gRYp/MZDxF+rt1Og6V24jLcUzO8coJnUQ
 rnJ5Rh6PGbul1kGRlxtgiJ5sY3pWgDpVPpxwjwPCveNLQ49Bu4ustgAKirGEK9vsFKzP
 NgECfusgOJ9c0U+3I8i8gHf8oMWoIT+kWUtnG+zoIj2L6cIOunc83u9JIiwvRdIjryrM
 ItuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761847070; x=1762451870;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NXUbL/o2sn1wUE5NQyCh4jieIT23KtAPiSUqZFn5Wbo=;
 b=VqidabaI5V2D7JGTl2Q1GoJr2muCxYSHamkDlawKoQEUS3kR5JK4axmB3omCiGKrX2
 JDCVJIGn14QP+lsKCJqIisrngW51zyvjzUZCOE0XeQA5cQodKRO7WHChE+n4cuSZ/mNo
 CwlMsTrSJcuSk+pzLEUOsnY9BTZGvQOnpZJROjFvy+qAz6qoC7LxZRRBeWadizyibkaH
 wlICcaYaKNbT+Z7SOuBWE1CH+l1SWKciV9++TbCqoIIydGmzSwLGRBQeT3wpL2Xnnctm
 nDYELCCImyj3cznvTzTZ0jEd7oZx+bG/soWOxaFDySlpRV6ARH3my7pcKhpNQaguYo78
 kSpQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXQ1MG6aiLqIKq8BgWU5lrCgNtcUAdkCbwDTnRQ2BuZp2j6S2Nl5MYApWgT34D+jBsfOB2r9Gfp/Ek=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyIGbNvsMjeRbU7eL58d0Y4wqyGrqPN59KmDV9OfcHN3528ONRM
 DYEVEra+HVbih3bNS3nzIwtfevNMBripUhlATakxfTBHTqIEvOIYt4G3tCpm3EvIXg469xvxoTX
 EqzqW1ExzH4dX8KTXN6xsEWFPt1cX8PYAMTiPGAQekLkWeA9lvJwNTaXBCt9dycKT/e0kKJo=
X-Gm-Gg: ASbGncs4hGEvAs/yLXnKNJNew2Kpcntgv9gFFkl/74dqX2+R01YqVRH1c5zemfs30C7
 5Rgx1U8k5gDtt/s37HErmCkdpIRKj1ww2ESX3gbjmjhPipusaMhI0rz+Bm6Ue+e2L6QD8EinnwZ
 gP8buVNv/ZzLZ0MFDYuy6PDR64+8YLxsl62fGl/fqmnPXGqy3uCbjZFavw3V7qSxYV/hE2LVgFm
 TZBmYzKEPYtX5zg8rsguBgBuPlJD5Fja7rhNHh8old+58XYYP0EKvDM3c2fBYzYGTnFcWAAWq/l
 S1MZHFFBRf1M1gVybxv7udMI/0+zR3LEmKnffxj+Mbf3Sitc53vizOgJWrHe9YX40xkF6wRTirx
 GVB7Ut1MLeItyyfXYTB4z8tX4O6TiUIfXqS5SWOfPY9Y5R6SkP9V9tlhZynh6nYq+paG/UnTs4a
 asFrHJqhkJ+Fvz
X-Received: by 2002:a05:622a:4819:b0:4ec:462e:242b with SMTP id
 d75a77b69052e-4ed30dd5e9amr7059531cf.20.1761847069925; 
 Thu, 30 Oct 2025 10:57:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHSejMKE1hkVv4Ot3up0lwT6Xym/gfPMX4mG8HNuzC+q9tmdfU3kR7miFO7Jd4zjFh1tmuVPw==
X-Received: by 2002:a05:622a:4819:b0:4ec:462e:242b with SMTP id
 d75a77b69052e-4ed30dd5e9amr7059051cf.20.1761847069338; 
 Thu, 30 Oct 2025 10:57:49 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59301f730acsm4806939e87.84.2025.10.30.10.57.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Oct 2025 10:57:48 -0700 (PDT)
Date: Thu, 30 Oct 2025 19:57:46 +0200
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
Message-ID: <r3sbg5r5pesrfrave7l6nx4ws62eogfn7m4f5c3ur2a6xkhsss@f5vfre2hd2cr>
References: <20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com>
 <20251023080609.1212-1-yuanjie.yang@oss.qualcomm.com>
 <20251023080609.1212-2-yuanjie.yang@oss.qualcomm.com>
 <zxofh6bwee3vjjlntlfqy7yg2iu2mipjvl7s5bcm6gbh233cjq@nuicjojawd2d>
 <aPsWEhM7i+gDjXE0@yuanjiey.ap.qualcomm.com>
 <4bnvh2ydtrmejknzpsxoalxoyjpq5g5cjbrico5ezbek24r52s@u5zy6ekh6lps>
 <aQF0zzUpLeUu4lrC@yuanjiey.ap.qualcomm.com>
 <5hftxsuqz745mxxk2hjpwfxwrm73p2l3dxn2mb2uqb2c44fd2w@l5xvadj7gvvg>
 <aQLInjBCbeNJVanK@yuanjiey.ap.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aQLInjBCbeNJVanK@yuanjiey.ap.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDE0OCBTYWx0ZWRfXz1dVXXJdIdF6
 +A+DcVrVgxRyJbrbQspsXs9AuEVBtEtAjX2v3U7qM41TBAvZ+shU2qHrlPaEUFY/uwkiEatNApY
 DTRR/d2ujXCLeq/VRTu+LsgGQcDSzC3X1jqGX87C0y7VkLHpgr3rzllM7GE1llq6UgWBv+GWeXX
 SobZTrKbnb1sR2UKhtA2EyCwdQ44Koh/5rHfMkPNFGxQbtpm/hr3wL/KOUJ5PQ4u4ZNIZ0oUgzF
 jMj5Xk0MD5eUtJLv0ddqnMsMjTKy3jR0Vk9Mmr1ih3zt563iwYYgkmRBlsFjaXtCf5GUVuBJUPE
 LrzxKBcunW15THPn4Ixtt+F7U2orqkXrNyeWzIpMUBnl12SgEWKNwVYebSrOSoty0w1G6fNIBzE
 qap1RKPy7em7lybgXPDC7L8KZ8UK0g==
X-Authority-Analysis: v=2.4 cv=P+Y3RyAu c=1 sm=1 tr=0 ts=6903a71e cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=cUaFMJGz6fvP16gA3dcA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: rNt0lECnwSsg9Z-wEiEqvSunD65NowmN
X-Proofpoint-GUID: rNt0lECnwSsg9Z-wEiEqvSunD65NowmN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_06,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 adultscore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2510300148
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

On Thu, Oct 30, 2025 at 10:08:30AM +0800, yuanjiey wrote:
> On Wed, Oct 29, 2025 at 02:20:13PM +0200, Dmitry Baryshkov wrote:
> > On Wed, Oct 29, 2025 at 09:58:39AM +0800, yuanjiey wrote:
> > > On Mon, Oct 27, 2025 at 02:22:04PM +0200, Dmitry Baryshkov wrote:
> > > > On Fri, Oct 24, 2025 at 02:00:50PM +0800, yuanjiey wrote:
> > > > > On Thu, Oct 23, 2025 at 03:14:38PM +0300, Dmitry Baryshkov wrote:
> > > > > > On Thu, Oct 23, 2025 at 04:06:04PM +0800, yuanjie yang wrote:
> > > > > > > From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > > > > > > 
> > > > > > > The NT37801 Sepc V1.0 chapter "5.7.1 Power On Sequence" states
> > > > > > > VDDI=1.65V~1.95V, so set sufficient voltage for panel nt37801.
> > > > > > > 
> > > > > > > Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > > > > > > Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > > > > > > ---
> > > > > > >  drivers/gpu/drm/panel/panel-novatek-nt37801.c | 5 +++++
> > > > > > >  1 file changed, 5 insertions(+)
> > > > > > > 
> > > > > > > diff --git a/drivers/gpu/drm/panel/panel-novatek-nt37801.c b/drivers/gpu/drm/panel/panel-novatek-nt37801.c
> > > > > > > index d6a37d7e0cc6..7eda16e0c1f9 100644
> > > > > > > --- a/drivers/gpu/drm/panel/panel-novatek-nt37801.c
> > > > > > > +++ b/drivers/gpu/drm/panel/panel-novatek-nt37801.c
> > > > > > > @@ -267,6 +267,11 @@ static int novatek_nt37801_probe(struct mipi_dsi_device *dsi)
> > > > > > >  	if (ret < 0)
> > > > > > >  		return ret;
> > > > > > >  
> > > > > > > +	ret = regulator_set_voltage(ctx->supplies[0].consumer,
> > > > > > > +				    1650000, 1950000);
> > > > > > 
> > > > > > This should be done in the DT. Limit the voltage per the user.
> > > > > Two reason:
> > > > > 1.
> > > > > I see https://patchwork.freedesktop.org/patch/354612/
> > > > > 
> > > > > panel panel-novatek-nt35510.c also use regulator_set_voltage set right voltage,
> > > > > so I do the same work.
> > > > 
> > > > Please look for the majority rather than the exceptions. Out of all
> > > > panel drivers only two set the voltage directly.
> > > > 
> > > > > 
> > > > > 2.     Kaanapali vddio regulator:
> > > > > 
> > > > > 		vreg_l12b_1p8: ldo12 {
> > > > > 			regulator-name = "vreg_l12b_1p8";
> > > > > 			regulator-min-microvolt = <1200000>;
> > > > > 			regulator-max-microvolt = <1800000>;
> > > > > 
> > > > > 	Voltage is from 1.2~.1.8 V , So I can not set it 1.65~1.95 V from DT(1.95V is beyond the allowed range).
> > > > > 	So I use regulator_set_voltage to set voltage, and regulator_set_voltage will choose the appropriate voltage.
> > > > 
> > > > DT has to list the voltage values that work for the devices on that
> > > > particular platform. So, ldo12 should be listing 1.64 - 1.8 V.
> > > get it. I check downstream DT,
> > >   dosnstream DT:
> > >    regulator-min-microvolt = <1800000>;
> > >    regulator-max-microvolt = <1800000>;
> > > 
> > >   I test 1.8V works, So I will add 1.8V in next patch, do you think it is ok?
> > 
> > What does panel's datasheet say?
> 
> The NT37801 Sepc V1.0 chapter "5.7.1 Power On Sequence" states 
> VDDI=1.65V~1.95V.
> 
> So I should follow datasheet to set DT ldo12: 1.64 - 1.8V ?

If the panel declares minimum voltage to 1.65 V, why are you declaring
1.64 V as the mimimal voltage for the rail?

> 
> if you think it is ture, I will fix it in next patch.
-- 
With best wishes
Dmitry
