Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5C72C22F9C
	for <lists+freedreno@lfdr.de>; Fri, 31 Oct 2025 03:22:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF86F10E154;
	Fri, 31 Oct 2025 02:22:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="MTKCRy3C";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ifTYqeZM";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEA5410E975
 for <freedreno@lists.freedesktop.org>; Fri, 31 Oct 2025 02:22:08 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59UIQs483115502
 for <freedreno@lists.freedesktop.org>; Fri, 31 Oct 2025 02:22:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=3c1obq8ZZLIS5GwXPjQ6YRMj
 wgPZ1GO2NkBLtaKSH38=; b=MTKCRy3C00PEmbbajCqM9XMRIvF2EC05LSoBw22u
 eBnXU0FrabPR3cpF6hGOD6gYTkAwQbQVRIRA6vDvQseAOEqQuepSKlej9SmCLIWq
 e2NEU7cTHtO9Q1fTh7ttZfb9Fr0+nZFQAGnMg7PaGSB1VdO1iN+t6iQKJlSe+R94
 VSVsxtVahIg6dFuwWyYJGPhBbt1hEkkAVkLluopHS+5Up4/vmjaFPxTaBDGcnz8G
 nqe0iX16qBTXFM6298vQqSNWwAfaIx0u4tgbi6k/FhbIh+/VXiEWoaTvtIJQHbaZ
 yKkQDWtjrB9O+FKhanWMBct4H+tbv2+pjILWPSVoFDgW8Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a45b42kjx-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 31 Oct 2025 02:22:07 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4eba1cea10dso59650751cf.1
 for <freedreno@lists.freedesktop.org>; Thu, 30 Oct 2025 19:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1761877327; x=1762482127;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=3c1obq8ZZLIS5GwXPjQ6YRMjwgPZ1GO2NkBLtaKSH38=;
 b=ifTYqeZMyVHfsP3L3VWE0Fg0CuVHDjhuotp6pM9SCTVw0cCDy63nZ/z2bHShpe7dPN
 xpjmPmAekAn+U0cNiSpk0FkPAM9e0QUUxqsOsV76JZ+/sXUvQFcKQDx2UcPCA8hLDVpT
 BzQYCEyQMZSowYAzCSbGBAj68pQEl/kfM7U2oTyGSiuXhsd/1uPQGBDaBKZqdKyvK7ll
 5KoiPk0HVLtOnSx9Zbr29kWdJ14S06HlK3RnFQh4qyftRvpaHASKVGs5fBrgIeWUbYq0
 kpGWoLQJWkFKcvxih+GyACJqTvYDlFdl6RVrLn9XH0VLsXNjQFDJ+nbk8n1YcICvkKh7
 kWRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761877327; x=1762482127;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3c1obq8ZZLIS5GwXPjQ6YRMjwgPZ1GO2NkBLtaKSH38=;
 b=Fsdx9+I24DfsTbCA6GBM/JrwPm5FC7Zc4QPHGi/TH/W9nMhM4uhdQxWSodU3Bpp+q1
 2hBWZHbDf+cVk6nxAlTNRVKe0OZE8sNHD0//Zx+EiFJZS8OrOthDDNrNuH/96YWarTXH
 X8LPsRY7JyLyYqV5WEo3622lplbN4swJRVzu2Mz1tvuB7vur9cOxi3D1/EAB08AWnB0J
 7bzJZhaYX+VcnIXR5WSd85I3858rKTXe2TE21FrSnIh15dTnZ8zEybcdcYzSPrcX0FGU
 L59RnumU97XDdQDpzzGcXtdyl/zh2xq8gkiuc2w6mIZPp5HMDg3WmO1sUf3dyvgnNj4Y
 k0cQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXE4drof/ttokdE9hl6iVRwT8wQm+4+hhYDvBX2wFi9q0t2FStJD/jRSGkB4784WEj6fJ1TsQkm2G0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwOZQAz/aNeu0JpadD9BUXd6Abp7YllUSJ1kD3hcngHstc0+DKI
 SvJnQbwCd/7L+uX0eCVTt/3Ix2i19vkrKLJfRcrbSSR2+btM96p5IFpuDrqJ7wqvQKCVcuG5nMc
 ZkVnddrUwg4DEbmGUJMBy5legzxXStZmxCczcuywHU6FR5YhMMRjH+lTGc8EXeoVXME9070Q=
X-Gm-Gg: ASbGncuaPMO3qHuRT73dvWtbo5tOLmu2VwQzwbIpyRxVYmSdGC/mMu6+kZaK8uwExU1
 H3wICTaV4dIsE2ccGS+afHWaCOWMwkRpatNgoKauTZ5ITZa9WEODN+r4wkpTEhNw5532sokipIY
 5vc0XASrQiqmzTcDap5Se/ml1l6Zhm53ug66CVcn08HhuN1R+LYyFHz7RG6r6RBXYsNgOH1yu4p
 m5S1aehZI+D2zHJlNBnNpnAKs440oyJrFMQqzsUt/QQSoVfMxJeraNmwtp1OHaOAC5SdmFQ1EQL
 lJj41l/kWR3oRmOJrqKVCwPaRJ4IKuAhFKTkVeJj43c7b3pusiEyGdQUas56iUvW8TGx5AXt6x9
 Nu3fwyBLVS8CNG0bmjqV15PShaIKTxEEnI03ADVlSnGM4rUdQuIHci+7T1ui0
X-Received: by 2002:a05:622a:44c:b0:4ed:2715:611d with SMTP id
 d75a77b69052e-4ed31076fc4mr20775791cf.65.1761877327137; 
 Thu, 30 Oct 2025 19:22:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGarE31FcqziYFgtP5AQeoEmQTIs0pBD7iyBHmNixxePHSIEujlFrVA2g4rLiwQlMH6ljRAYw==
X-Received: by 2002:a05:622a:44c:b0:4ed:2715:611d with SMTP id
 d75a77b69052e-4ed31076fc4mr20775461cf.65.1761877326654; 
 Thu, 30 Oct 2025 19:22:06 -0700 (PDT)
Received: from yuanjiey.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com.
 [129.46.232.65]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8ac03a75453sm23545385a.51.2025.10.30.19.21.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Oct 2025 19:22:06 -0700 (PDT)
Date: Fri, 31 Oct 2025 10:21:54 +0800
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
Message-ID: <aQQdQoCLeKhYtY7W@yuanjiey.ap.qualcomm.com>
References: <20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com>
 <20251023080609.1212-1-yuanjie.yang@oss.qualcomm.com>
 <20251023080609.1212-2-yuanjie.yang@oss.qualcomm.com>
 <zxofh6bwee3vjjlntlfqy7yg2iu2mipjvl7s5bcm6gbh233cjq@nuicjojawd2d>
 <aPsWEhM7i+gDjXE0@yuanjiey.ap.qualcomm.com>
 <4bnvh2ydtrmejknzpsxoalxoyjpq5g5cjbrico5ezbek24r52s@u5zy6ekh6lps>
 <aQF0zzUpLeUu4lrC@yuanjiey.ap.qualcomm.com>
 <5hftxsuqz745mxxk2hjpwfxwrm73p2l3dxn2mb2uqb2c44fd2w@l5xvadj7gvvg>
 <aQLInjBCbeNJVanK@yuanjiey.ap.qualcomm.com>
 <r3sbg5r5pesrfrave7l6nx4ws62eogfn7m4f5c3ur2a6xkhsss@f5vfre2hd2cr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <r3sbg5r5pesrfrave7l6nx4ws62eogfn7m4f5c3ur2a6xkhsss@f5vfre2hd2cr>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMxMDAxOSBTYWx0ZWRfXz81At2E8rckp
 jUzXF9JvedPq0q+fPwCbcPSfiSfQZmU3Cy7uelB4QK6wlIXMJzR1xz74yNkGZDL/9Ox24u9WYYO
 cpLbvnn3ZlCVknfNgCg+bFS/D1IIGkgGlKuhR9wNowJa3jv7E/XqrL4c+jNhlbfg68MD5ZU1qL5
 oi66b5zfgZMxWXG39Y7VpwmYfmGVv85d4NOjs7mhmIEGVUsu75vTN/xNXXUgPR15hBsipoLUHSG
 Ko4ity4qai0Bdv65Wm14uyVxBKxa+uQwEdnPs9OEO/NSh2/Ko308l9aKRY4oOtmxyO1lOAno1K1
 39TUAcpD0aSoYNPwZJP2/t9oSU4f+EW2PmV1Tiap5rB8+jcsqq9y5KFrK/sDw4YigAfMG9bE6h1
 uVUZoqeEP9Go6cUP2Q4ASP5vptkk7Q==
X-Authority-Analysis: v=2.4 cv=KePfcAYD c=1 sm=1 tr=0 ts=69041d4f cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=kj9zAlcOel0A:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8
 a=hV_kQwtX5ugguncQdNAA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: gwIO8lBjxU8YFcTR45LPPYKSgoEB2C5U
X-Proofpoint-GUID: gwIO8lBjxU8YFcTR45LPPYKSgoEB2C5U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_08,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510310019
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

On Thu, Oct 30, 2025 at 07:57:46PM +0200, Dmitry Baryshkov wrote:
> On Thu, Oct 30, 2025 at 10:08:30AM +0800, yuanjiey wrote:
> > On Wed, Oct 29, 2025 at 02:20:13PM +0200, Dmitry Baryshkov wrote:
> > > On Wed, Oct 29, 2025 at 09:58:39AM +0800, yuanjiey wrote:
> > > > On Mon, Oct 27, 2025 at 02:22:04PM +0200, Dmitry Baryshkov wrote:
> > > > > On Fri, Oct 24, 2025 at 02:00:50PM +0800, yuanjiey wrote:
> > > > > > On Thu, Oct 23, 2025 at 03:14:38PM +0300, Dmitry Baryshkov wrote:
> > > > > > > On Thu, Oct 23, 2025 at 04:06:04PM +0800, yuanjie yang wrote:
> > > > > > > > From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > > > > > > > 
> > > > > > > > The NT37801 Sepc V1.0 chapter "5.7.1 Power On Sequence" states
> > > > > > > > VDDI=1.65V~1.95V, so set sufficient voltage for panel nt37801.
> > > > > > > > 
> > > > > > > > Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > > > > > > > Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > > > > > > > ---
> > > > > > > >  drivers/gpu/drm/panel/panel-novatek-nt37801.c | 5 +++++
> > > > > > > >  1 file changed, 5 insertions(+)
> > > > > > > > 
> > > > > > > > diff --git a/drivers/gpu/drm/panel/panel-novatek-nt37801.c b/drivers/gpu/drm/panel/panel-novatek-nt37801.c
> > > > > > > > index d6a37d7e0cc6..7eda16e0c1f9 100644
> > > > > > > > --- a/drivers/gpu/drm/panel/panel-novatek-nt37801.c
> > > > > > > > +++ b/drivers/gpu/drm/panel/panel-novatek-nt37801.c
> > > > > > > > @@ -267,6 +267,11 @@ static int novatek_nt37801_probe(struct mipi_dsi_device *dsi)
> > > > > > > >  	if (ret < 0)
> > > > > > > >  		return ret;
> > > > > > > >  
> > > > > > > > +	ret = regulator_set_voltage(ctx->supplies[0].consumer,
> > > > > > > > +				    1650000, 1950000);
> > > > > > > 
> > > > > > > This should be done in the DT. Limit the voltage per the user.
> > > > > > Two reason:
> > > > > > 1.
> > > > > > I see https://patchwork.freedesktop.org/patch/354612/
> > > > > > 
> > > > > > panel panel-novatek-nt35510.c also use regulator_set_voltage set right voltage,
> > > > > > so I do the same work.
> > > > > 
> > > > > Please look for the majority rather than the exceptions. Out of all
> > > > > panel drivers only two set the voltage directly.
> > > > > 
> > > > > > 
> > > > > > 2.     Kaanapali vddio regulator:
> > > > > > 
> > > > > > 		vreg_l12b_1p8: ldo12 {
> > > > > > 			regulator-name = "vreg_l12b_1p8";
> > > > > > 			regulator-min-microvolt = <1200000>;
> > > > > > 			regulator-max-microvolt = <1800000>;
> > > > > > 
> > > > > > 	Voltage is from 1.2~.1.8 V , So I can not set it 1.65~1.95 V from DT(1.95V is beyond the allowed range).
> > > > > > 	So I use regulator_set_voltage to set voltage, and regulator_set_voltage will choose the appropriate voltage.
> > > > > 
> > > > > DT has to list the voltage values that work for the devices on that
> > > > > particular platform. So, ldo12 should be listing 1.64 - 1.8 V.
> > > > get it. I check downstream DT,
> > > >   dosnstream DT:
> > > >    regulator-min-microvolt = <1800000>;
> > > >    regulator-max-microvolt = <1800000>;
> > > > 
> > > >   I test 1.8V works, So I will add 1.8V in next patch, do you think it is ok?
> > > 
> > > What does panel's datasheet say?
> > 
> > The NT37801 Sepc V1.0 chapter "5.7.1 Power On Sequence" states 
> > VDDI=1.65V~1.95V.
> > 
> > So I should follow datasheet to set DT ldo12: 1.64 - 1.8V ?
> 
> If the panel declares minimum voltage to 1.65 V, why are you declaring
> 1.64 V as the mimimal voltage for the rail?

Corrcet here:

DT ldo12 will be  1.65 - 1.8V

Thanks,
Yuanjie

 
> > 
> > if you think it is ture, I will fix it in next patch.
> -- 
> With best wishes
> Dmitry
