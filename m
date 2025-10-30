Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA43CC1E17F
	for <lists+freedreno@lfdr.de>; Thu, 30 Oct 2025 03:08:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AC2610E87F;
	Thu, 30 Oct 2025 02:08:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="e/aiOE48";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K3QKVkRN";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF29710E87F
 for <freedreno@lists.freedesktop.org>; Thu, 30 Oct 2025 02:08:44 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59TLGppr1655938
 for <freedreno@lists.freedesktop.org>; Thu, 30 Oct 2025 02:08:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=O/baTxXJPCHgYea9og1wAW8N
 5bDqCLQ1vuQ5vgT1fIE=; b=e/aiOE48Z02ig1rIP7e4M6lp3d/MqYESQvmoQSI9
 QaJY8pHe1TiXXHq5VR0Hg3XfPI3ChmFEPOOlFQuGVGLa3ub5hYq66WQkDw3abiZt
 PTU/BjYftESI6i8BshQQ6y8RPODxJYMWvf0ClKjSFlcxbg8+GIcOTUKjGioOOZqX
 3M8h556CSw8R/pKBMtzN50ibyg/dQ1S0a16sst31GrI/e5IN8C4GT6SktVOShrMc
 jOLbTqwjfwLh4yk7O5tBIEh+zynp4yXpBE0jFbuIsRNaL932f7g1KE2y1FYf0i6i
 eoOIRdVS/WnSyxnTUdbrFJrAUVPuIIX4uM6TAedVLoZaTQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a3tptrq6k-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 30 Oct 2025 02:08:44 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-89ee646359cso150629785a.1
 for <freedreno@lists.freedesktop.org>; Wed, 29 Oct 2025 19:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1761790123; x=1762394923;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=O/baTxXJPCHgYea9og1wAW8N5bDqCLQ1vuQ5vgT1fIE=;
 b=K3QKVkRNRFIH5XgUAf40HLM+Gr4MYX7PhZY97gVKHIwCW6a6moon55ZWsQxwtELm1P
 8r+syMUuB35DUyxFVWXfsRN/wSHbfI3bGSxFiuq/iDbiMjc/2xjhfEApv6I3pzs2Q1in
 He7J8kz2H7F2nZ1KH9LNIbOmW1r+lGU6QxS5YVPCZ+8FYn+ZRpqFjcJEzWQwoR3M3kTp
 SctCvYFOHX4G9353dsFikYljOAsld8Qs3gaEd55xQqWJocBr53Nr6UD21pjoIPjw+AyQ
 lT8R90TYvzSjbEhTR2ItX3tV3DbpmReHfHbnwl3earZjaVS8zsPEBi5dQT2BOH6DN75N
 9g+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761790123; x=1762394923;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=O/baTxXJPCHgYea9og1wAW8N5bDqCLQ1vuQ5vgT1fIE=;
 b=tV9e9J0/GZ8vyGwKAnBSnwKZ2XWcfAUFA/HNWMYZ0utCIqqywXuRhy9DY24p8jlpox
 gGB1XaaFDoeNakOeNOziQ+IQTew4p7tx+ngIHtD4lzz00dHOkVemixL/Kdm0SGj8PJdr
 cxzx29PuNmGT/4qf+hc70RrHeX25t8dTNqIp8GB0OaFK/+w+VLqnUL7a0Cvmy+wM+Yi7
 xWH1JHn7PEZZNAAoVRvZoBhH5hvMV2Pf/dgR9ep0b6Lqh8t92KhfdlHGbM/hA9OYyUl3
 gCZBkov1r6nNieUTtYuo/kugjCsf5FeU+hwrCZB6+V456syDgMYUDt9YNHI3xtW5Yy4X
 Htaw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVyjpzePugOVw8zvukUkFbrhP1EFc1B+Lz0W295A6mYEcbWL4GFCNxD2rtb39LrW5BOvJUfXWoTLNE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyVejD9btbykmtIk6YL2dagqXtmN6ttlUA3QAeRzZJuVP4uMcFi
 A9QK9OC7eYm1FNXbae1krW57pznSccae491u/TDtqH7RTqJxHTHIzkeMBGol9u1E24o+9YcXW0U
 bdHbMaJ7JAbgeEkLceySQei8EE/7GfTnLKgtqD8iolqNuy8EMkI3r9F/92jC1OAuNtcsGoHc=
X-Gm-Gg: ASbGncsYhUuH0RhBTnC7nO3DKoRnd3QArIFPcbnTHU0YXGH7bYm1r7NEf6032x2UzTx
 HdfS0DScA40bGBnP8iJqp8AErjSe3PbCnxR172turb6p8Hm6kqGWbYjBV9ldmjiV7ZR1sTbzqT9
 flIo8lpdLV4JTppvuw3/7YXL0Hhc8oLXR5XP1IDtAlzVpDGw6WnRqNLDoBL+Km1NFrw7EXWqAPc
 u9nAh7p367HBPnqs40OFNaRRJp4EL0DLsEnNIPKQz04tFSM/8nt7T1ymbGJJOGWWuzpvhc8csQW
 M3mNLajOlPVCrpQu07eRANDrwYW5wwhBtvMXtSESAGxt4KByBkWMzd+DugEAP8ukL1YFwJPAB2d
 4pOZYynrtp33yfFNmyH951zOttO2IE/z03twP47jVAmMbUq3S8PDAI42tj5kl
X-Received: by 2002:a05:620a:45a3:b0:7e7:12c7:57d with SMTP id
 af79cd13be357-8aa2de73b12mr257836485a.44.1761790123304; 
 Wed, 29 Oct 2025 19:08:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFfgmXNfYz7FjFrXiMMcOt/IAAGlLFbwsCSB3+3x8FbOF3Ov9Sbc6o7BWOw3LDDSUkHLl+H0A==
X-Received: by 2002:a05:620a:45a3:b0:7e7:12c7:57d with SMTP id
 af79cd13be357-8aa2de73b12mr257833485a.44.1761790122795; 
 Wed, 29 Oct 2025 19:08:42 -0700 (PDT)
Received: from yuanjiey.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com.
 [129.46.232.65]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-89f25798afesm1161546485a.37.2025.10.29.19.08.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Oct 2025 19:08:41 -0700 (PDT)
Date: Thu, 30 Oct 2025 10:08:30 +0800
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
Message-ID: <aQLInjBCbeNJVanK@yuanjiey.ap.qualcomm.com>
References: <20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com>
 <20251023080609.1212-1-yuanjie.yang@oss.qualcomm.com>
 <20251023080609.1212-2-yuanjie.yang@oss.qualcomm.com>
 <zxofh6bwee3vjjlntlfqy7yg2iu2mipjvl7s5bcm6gbh233cjq@nuicjojawd2d>
 <aPsWEhM7i+gDjXE0@yuanjiey.ap.qualcomm.com>
 <4bnvh2ydtrmejknzpsxoalxoyjpq5g5cjbrico5ezbek24r52s@u5zy6ekh6lps>
 <aQF0zzUpLeUu4lrC@yuanjiey.ap.qualcomm.com>
 <5hftxsuqz745mxxk2hjpwfxwrm73p2l3dxn2mb2uqb2c44fd2w@l5xvadj7gvvg>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5hftxsuqz745mxxk2hjpwfxwrm73p2l3dxn2mb2uqb2c44fd2w@l5xvadj7gvvg>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDAxNSBTYWx0ZWRfX+LfmpNu87Q+6
 g+Jga+JS5y6By7sP6pfpQKgbzEE4pBmGgedSLGRqfgYcGu7Tg7mMRQKbnCPfTQYiergDURa+nmg
 oQuvoQVp+C2KgADoiJm661c+vQMXOoqiJcZ/QLHsiOjTTMfvIMftQL7ZZNEAAiLOFEiSzxakUIM
 Z6huCcS6jckcrgddd3csXSw4LtCKmRVo1xuMjvrdj+cFfCxbYi7uVomrUqSNPeBKwubFPm2vXDr
 SSBwj53UUict2qrHoNcv5uYFIHEX8jZgViPp4yvYVqpQvyKnJnwWjuzF5klDtsVqyWdCFa2ZQO1
 krUCdyhwjC5kQbZyGCibQOb5/WVmsgs6dQie9W4qdEmmHWIzf2K4pzO3ennkaiTWd86so5RHagj
 DUF7C1L9Zzb/K02eWDB1NK8CtB5jjA==
X-Proofpoint-GUID: uaTIOCY7y60TINsKRune4_J56u4rSmyD
X-Authority-Analysis: v=2.4 cv=MuRfKmae c=1 sm=1 tr=0 ts=6902c8ac cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=kj9zAlcOel0A:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8
 a=Glo02QtyTbYzxwwq8ScA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: uaTIOCY7y60TINsKRune4_J56u4rSmyD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_01,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 phishscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2510300015
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

On Wed, Oct 29, 2025 at 02:20:13PM +0200, Dmitry Baryshkov wrote:
> On Wed, Oct 29, 2025 at 09:58:39AM +0800, yuanjiey wrote:
> > On Mon, Oct 27, 2025 at 02:22:04PM +0200, Dmitry Baryshkov wrote:
> > > On Fri, Oct 24, 2025 at 02:00:50PM +0800, yuanjiey wrote:
> > > > On Thu, Oct 23, 2025 at 03:14:38PM +0300, Dmitry Baryshkov wrote:
> > > > > On Thu, Oct 23, 2025 at 04:06:04PM +0800, yuanjie yang wrote:
> > > > > > From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > > > > > 
> > > > > > The NT37801 Sepc V1.0 chapter "5.7.1 Power On Sequence" states
> > > > > > VDDI=1.65V~1.95V, so set sufficient voltage for panel nt37801.
> > > > > > 
> > > > > > Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > > > > > Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > > > > > ---
> > > > > >  drivers/gpu/drm/panel/panel-novatek-nt37801.c | 5 +++++
> > > > > >  1 file changed, 5 insertions(+)
> > > > > > 
> > > > > > diff --git a/drivers/gpu/drm/panel/panel-novatek-nt37801.c b/drivers/gpu/drm/panel/panel-novatek-nt37801.c
> > > > > > index d6a37d7e0cc6..7eda16e0c1f9 100644
> > > > > > --- a/drivers/gpu/drm/panel/panel-novatek-nt37801.c
> > > > > > +++ b/drivers/gpu/drm/panel/panel-novatek-nt37801.c
> > > > > > @@ -267,6 +267,11 @@ static int novatek_nt37801_probe(struct mipi_dsi_device *dsi)
> > > > > >  	if (ret < 0)
> > > > > >  		return ret;
> > > > > >  
> > > > > > +	ret = regulator_set_voltage(ctx->supplies[0].consumer,
> > > > > > +				    1650000, 1950000);
> > > > > 
> > > > > This should be done in the DT. Limit the voltage per the user.
> > > > Two reason:
> > > > 1.
> > > > I see https://patchwork.freedesktop.org/patch/354612/
> > > > 
> > > > panel panel-novatek-nt35510.c also use regulator_set_voltage set right voltage,
> > > > so I do the same work.
> > > 
> > > Please look for the majority rather than the exceptions. Out of all
> > > panel drivers only two set the voltage directly.
> > > 
> > > > 
> > > > 2.     Kaanapali vddio regulator:
> > > > 
> > > > 		vreg_l12b_1p8: ldo12 {
> > > > 			regulator-name = "vreg_l12b_1p8";
> > > > 			regulator-min-microvolt = <1200000>;
> > > > 			regulator-max-microvolt = <1800000>;
> > > > 
> > > > 	Voltage is from 1.2~.1.8 V , So I can not set it 1.65~1.95 V from DT(1.95V is beyond the allowed range).
> > > > 	So I use regulator_set_voltage to set voltage, and regulator_set_voltage will choose the appropriate voltage.
> > > 
> > > DT has to list the voltage values that work for the devices on that
> > > particular platform. So, ldo12 should be listing 1.64 - 1.8 V.
> > get it. I check downstream DT,
> >   dosnstream DT:
> >    regulator-min-microvolt = <1800000>;
> >    regulator-max-microvolt = <1800000>;
> > 
> >   I test 1.8V works, So I will add 1.8V in next patch, do you think it is ok?
> 
> What does panel's datasheet say?

The NT37801 Sepc V1.0 chapter "5.7.1 Power On Sequence" states 
VDDI=1.65V~1.95V.

So I should follow datasheet to set DT ldo12: 1.64 - 1.8V ?

if you think it is ture, I will fix it in next patch.

Thanks,
Yuanjie
 
> -- 
> With best wishes
> Dmitry
