Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2B8FCC119A
	for <lists+freedreno@lfdr.de>; Tue, 16 Dec 2025 07:30:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C30810E6E2;
	Tue, 16 Dec 2025 06:30:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="eNMP9DtO";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PvQ+S7a6";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC3E510E6D2
 for <freedreno@lists.freedesktop.org>; Tue, 16 Dec 2025 06:30:13 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BG2YLA31205744
 for <freedreno@lists.freedesktop.org>; Tue, 16 Dec 2025 06:30:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=ZOKoVU0nO8MaG0cbLAOwDYoo
 QPDcG7ORKxJsSltYtdI=; b=eNMP9DtO5xC1pnAdknWowTItD9/iL6uXQrNs6YJV
 zqfEb8DNDRPCC8IyWFZ+a56YLNaNhaZqwgD8+oZDZYbAeviU4AT8/h2m9HqigJ4d
 shxQesNTZPpiBM7JJxNlWNlDAQ1x7RAqBgzKkml8sZ/OGOj8AG09W69jXpBgnyWK
 f6Q0+n+nMwVy2idyqwGM97a4m8f8iyF9JUzcvplbQpNFMAEzaLuB8RPR4wt6dNxA
 VuZgEohVNjXbYS4CE7jF7BfXapoJtpQx6I0PY2HcjJviIKb8TQUJiTtARNmAOIL7
 YfkU6ovsCSsnVykvAOVSBrvj2gQpnHW0HyY6JSOFjDw2ZA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b2pdajex6-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 16 Dec 2025 06:30:13 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8bb9f029f31so737483185a.2
 for <freedreno@lists.freedesktop.org>; Mon, 15 Dec 2025 22:30:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1765866612; x=1766471412;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ZOKoVU0nO8MaG0cbLAOwDYooQPDcG7ORKxJsSltYtdI=;
 b=PvQ+S7a6XxlFazlAgb4GOUKG8cFPCsQhTQYKaquafEM9qGd9zgulAloknCtSkhU3zn
 fZNah+DSqh33oWDrspK40+ADMCyoKu1+nYUkOoblmz5t6Cn7PsPizx9k6ux1Kf99AFg6
 A8FSlO5aDpJJMuwVGX/LbDaqbDTdNtW17yf4t6i4yOoHFIqhjDb3bLQoxFGo7+6TQGGm
 tCfSzP3gopUjYvojkt35r4gvUa4JpuKNbUuCq8PJzMyqauQJd88CbCdZs2GANx7uqvqk
 psTwGwEGWgPDFI4cMrhb/fRG0MhMdIgy5dmPWiDflJcvwXqPNiGHkuuVfyeyisHT4qNO
 cCwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765866612; x=1766471412;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZOKoVU0nO8MaG0cbLAOwDYooQPDcG7ORKxJsSltYtdI=;
 b=eo6gtg+dm83E5kSDtwjqpA/bKxU5cBtMqu40DazwssZsTMLwGGTlBZ1zwXYZH429nX
 m7jDhNUojNN5GCSUlt3yEqzXLVzdHVj9BNACQ2LEjQu03VHe+13NZuLhp4dL6mrDovhm
 quAfmzQYfXXY7mkXMmOEW9w+/JWOqNTFgNKYoBhjscp9oYQaBiXLAbty7HhCQWvMHv8K
 65q7q4ybvL22y4Yym/6g5sjZsIWcvqSvLz5grLuoOKeKugtlbkgyEnNn0POMluy3NU+d
 sS6xefWphGbBMdd0soU79CQt4zZilcpl5J55X1G3GGVuHlaPmUbWmc2bwZkzZdyezfGN
 r3eA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWNKK5r5MMlwdLnNcL0X6lxCivBrx7EnJWkayVNwJ774s7EwZGUAVnAWtVQbdsZ48B2FfE52XZjmDg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxmw2ZjZCEa5LIFbA72myVihkiPEtc2YYzHyg4AGoayatHlcLdZ
 wOrvoJvugU/2610q88VZzls8nltUBDG7SNwhqY/iLChU0lyPILCZsaopLSAyUboKrITWyee1XYU
 yYLPh7opr6eWVB+WIfPrAOdN6hKiij7cx2HJDIH1t3n24lVQTOY5X7Nz3iT4d/CIqDNjhbZg=
X-Gm-Gg: AY/fxX74fjMMMe25P5PraQYKH2rWa0abZ/hol7bbA7qnPKwsNPWa9Mezp7OlAVpUSSf
 gTquRvJCdRPyMW6VTraWuQ8qdhqyCOgkSSVVt8Sf8xwTyiDoPqEB0uCxz9jG3EX7QtNw8MCE36Y
 XOm44gia464CdMU6aMdMvDuwdRKa/VPSRkV7WN9fq9BTzv1+rG2LaMnsp5Bqdjpn64IYQXCdqCJ
 aJkhTkR5eFYT8YyY8qRXj4llPp97pz1uMEpDl6p3JGalhgrrJdtMyBhR85ztqgSLFeARctOqmBD
 kcqAWJp/af+QAkDTE5WnOJhjYGRnHLbXx8L5sAGKv1mJyowbqgQ89kpKda2pTV5ZHC1d3O3WsJ9
 7HV5GN32IFA/DqbnZJi6VmPVAr1qHaGxgmgubKBAE8UlVjLFMVfMh/bC7Ay+JsHnC4Nde3ws=
X-Received: by 2002:a05:620a:1a87:b0:8b2:db27:425e with SMTP id
 af79cd13be357-8bb3a2113camr1826050985a.50.1765866612065; 
 Mon, 15 Dec 2025 22:30:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHmgbzqVkC2sXrT+x0ZCW9D4FsdZmJkOPQHKCtJ3rLA4qYdqbCXcJCXegubktDtZajGh89Q/A==
X-Received: by 2002:a05:620a:1a87:b0:8b2:db27:425e with SMTP id
 af79cd13be357-8bb3a2113camr1826047885a.50.1765866611625; 
 Mon, 15 Dec 2025 22:30:11 -0800 (PST)
Received: from yuanjiey.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com.
 [129.46.232.65]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8be303e7e51sm131155585a.7.2025.12.15.22.30.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Dec 2025 22:30:11 -0800 (PST)
Date: Tue, 16 Dec 2025 14:30:00 +0800
From: yuanjiey <yuanjie.yang@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
 jesszhan0024@gmail.com, sean@poorly.run, marijn.suijten@somainline.org,
 airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org,
 yongxing.mou@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
 aiqun.yu@oss.qualcomm.com
Subject: Re: [PATCH v3 05/11] drm/msm/mdss: Add support for Kaanapali
Message-ID: <aUD8aA/5J93KBZ8Q@yuanjiey.ap.qualcomm.com>
References: <20251215083854.577-1-yuanjie.yang@oss.qualcomm.com>
 <20251215083854.577-6-yuanjie.yang@oss.qualcomm.com>
 <k7k7fpmlde4tjiqxhzbf67olcdzsfmctendyjeewwh6v2kkl3i@33t2qfjxhwdp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <k7k7fpmlde4tjiqxhzbf67olcdzsfmctendyjeewwh6v2kkl3i@33t2qfjxhwdp>
X-Proofpoint-GUID: duB2Jvg3oU1DyyZ-hEawTKdfqc_-nMCU
X-Proofpoint-ORIG-GUID: duB2Jvg3oU1DyyZ-hEawTKdfqc_-nMCU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE2MDA1MSBTYWx0ZWRfXw7X6GloUp2Ds
 OiD2+EFzvwjsjwpOZnHQGoCUNT4cz8Buh1CqqQRzj/Zo7MhLcUK42dxy23mrysDfhKhRJS3l1TO
 dJbV0xfEpom1RBDDjqrEnPZVyUEa0j8sbkzv8LracVN98kmzJps6yc09YauRQNc0iQwnu1CYlHe
 3YAMMz/ISmtvQN0V+q2HpMLSpUvUkvmj6vGYPTPWh6BJU2sLLLQo1gvyLhEbHEcNSMtDCiOEXfp
 es1Y5Pb1bCwTa6BPWwRVtwmoUEickrjb74ltyDFP+M32AmbJH3gXKyVgRzm4EUllkbMNOIpNK8E
 s5PYE/EJE9KQ5dOW9IYTo2izrAhwcJ15arWAM+7usOWw9NTtViGNy1bnyYZFuWXTDdD8u7LGGQy
 SiYlHa6sRdCtGOWFEBnp7zolPLHfEA==
X-Authority-Analysis: v=2.4 cv=JYqxbEKV c=1 sm=1 tr=0 ts=6940fc75 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=kj9zAlcOel0A:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=K6Vp4ACmwqLtMlq4UooA:9
 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-16_01,2025-12-15_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 spamscore=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512160051
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

On Mon, Dec 15, 2025 at 09:58:27PM +0200, Dmitry Baryshkov wrote:
> On Mon, Dec 15, 2025 at 04:38:48PM +0800, yuanjie yang wrote:
> > From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > 
> > Add mdss support for the Qualcomm Kaanapali platform.
> > 
> > Co-developed-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > ---
> >  drivers/gpu/drm/msm/msm_mdss.c | 10 +++++++++-
> >  1 file changed, 9 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
> > index bf9a33e925ac..cd330870a6fb 100644
> > --- a/drivers/gpu/drm/msm/msm_mdss.c
> > +++ b/drivers/gpu/drm/msm/msm_mdss.c
> > @@ -239,7 +239,11 @@ static void msm_mdss_setup_ubwc_dec_50(struct msm_mdss *msm_mdss)
> >  
> >  	writel_relaxed(value, msm_mdss->mmio + REG_MDSS_UBWC_STATIC);
> >  
> > -	writel_relaxed(4, msm_mdss->mmio + REG_MDSS_UBWC_CTRL_2);
> > +	if (data->ubwc_dec_version == UBWC_5_0)
> 
> This is the _dec_50 function, you can't make UBWC_5_0 into a special
> case.
will fix.

Thanks,
Yuanjie
> > +		writel_relaxed(4, msm_mdss->mmio + REG_MDSS_UBWC_CTRL_2);
> > +	else
> > +		writel_relaxed(5, msm_mdss->mmio + REG_MDSS_UBWC_CTRL_2);
> > +
> >  	writel_relaxed(1, msm_mdss->mmio + REG_MDSS_UBWC_PREDICTION_MODE);
> >  }
> >  
> > @@ -296,6 +300,9 @@ static int msm_mdss_enable(struct msm_mdss *msm_mdss)
> >  	case UBWC_5_0:
> >  		msm_mdss_setup_ubwc_dec_50(msm_mdss);
> >  		break;
> > +	case UBWC_6_0:
> > +		msm_mdss_setup_ubwc_dec_50(msm_mdss);
> > +		break;
> >  	default:
> >  		dev_err(msm_mdss->dev, "Unsupported UBWC decoder version %x\n",
> >  			msm_mdss->mdss_data->ubwc_dec_version);
> > @@ -552,6 +559,7 @@ static const struct msm_mdss_data data_153k6 = {
> >  };
> >  
> >  static const struct of_device_id mdss_dt_match[] = {
> > +	{ .compatible = "qcom,kaanapali-mdss", .data = &data_57k },
> >  	{ .compatible = "qcom,mdss", .data = &data_153k6 },
> >  	{ .compatible = "qcom,glymur-mdss", .data = &data_57k },
> >  	{ .compatible = "qcom,msm8998-mdss", .data = &data_76k8 },
> > -- 
> > 2.34.1
> > 
> 
> -- 
> With best wishes
> Dmitry
