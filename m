Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69377D15F99
	for <lists+freedreno@lfdr.de>; Tue, 13 Jan 2026 01:24:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EEFE10E43E;
	Tue, 13 Jan 2026 00:24:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="WnpIResj";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L2NHf44J";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FD3F10E43E
 for <freedreno@lists.freedesktop.org>; Tue, 13 Jan 2026 00:24:51 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60CN5CSW3300067
 for <freedreno@lists.freedesktop.org>; Tue, 13 Jan 2026 00:24:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=dzxkXozKtULhcUZuJh1MUOqg
 XLBE5AuFunSWmMnWvjI=; b=WnpIResjGpzemU0cGefeUfym+RgYNJJ4pdc3juM3
 DeeHYy7ACajDJoQxQAl9+ci16isOb7UB17G/i3lB3w+Lgez0c5cXN0uvrSNRRCTo
 ARm46dTkyaDL0+muCBT8RYs9LYwrWaexu8mWYjgIkyq19idWKZANZgqmbsKLaDHc
 BMTZcCn1ZyMxcpVJIHKFXb5LyQRjVttqZtxI8W/54kd6JrLFJ1SnWGzl9ZEz69Rk
 xTbOqRGEkDuentWxforWADOoBXBVXMCvdKAhfVvkl/c2FpSNxh6lZk///x3iYj94
 gYiGy4uHhLUM9m1D4S5mH+HIrdNWZkuN4G4OBAxhvar9tQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bn6jm8rys-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 13 Jan 2026 00:24:50 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8bb9f029f31so1910289285a.2
 for <freedreno@lists.freedesktop.org>; Mon, 12 Jan 2026 16:24:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768263889; x=1768868689;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=dzxkXozKtULhcUZuJh1MUOqgXLBE5AuFunSWmMnWvjI=;
 b=L2NHf44JBtCak88UNtSuHRfFsSR+LbIHGpLA3rnxi6Sf7phRr8/8zHFIsQWJIR5J18
 tw2CO9F/POjxV8txSyXRx8rErqMSX9ft+GpVVgXjgwXN2ClFY+lG01G/SEg/71wWpJtP
 f/wzA25USAROiQEaL7a+bXSR0kOWmIQ7meNk892/TYajq5/px5EThZye841O0j/30o+x
 uhUJcyamdw+zUne6tRoAtrKTKWvTsAdvZ7a1QwYsyfzL6+WKKzfGpBglciFJh5ipxfZt
 FLHmi1kaxzBlYcmZLNqt/71cYxlnNkkY0OCyLyFG2oHxpD/hlZTXG6uaMU50JfCXBh9+
 lKYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768263889; x=1768868689;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dzxkXozKtULhcUZuJh1MUOqgXLBE5AuFunSWmMnWvjI=;
 b=OBcolqEWwU4+G9Fp4sBZkAN9U60mXty5xxxs57Yyy9L+CFbaAtzIdR1m7xUKj94HKt
 9NFRkxkg8ctL3X8jqNOfoGH407qqajfE6guRfsknEQ9YZrw7X82nvqisTDrO4Pw3rDuf
 JkqIFABXYwtKxh5FXBvCuMsBNv/4lKYqb45Anx8Zc3C0hbYL9a8VAQCBgjMViTOVLZc7
 zV849QQu4KKClbBwamIFj6ZdV5wE4qdVfOz6z1p0/KBL5eiWxM9mGiOvc/qKFYGHkhXu
 HqvEO2tFpPzvnouZHJOSBvm/HO8/7hHr3M8BQaiiifFy0ugS4EIpRFFlr9J1uwguGXcH
 CBMw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXzRBIc3IUarjzTI8OE+5mzaa4R8+uLIgCUwp7H3e14NK+foMaJ5ADQGwhq05FG9YzG2lnLrd2/2wk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzQGDaLIZ0dhXeMOOkHRTLGv6IYyqvVGGB/wX6jVDAP/7g+i+Jo
 elLv9FCARYE/NCI0C0dfYXomjmqOWb3JYI7TJC7lb0UKJJlKZF+BvRCtRP3SZT+zSj3Z7nalPn4
 E6LLNzhwoIMYU4zARZTC2469Pen8yZvMIyzJ68wPdzDLiXcMJkNYufFSwLP59SziV5G+Wmu4=
X-Gm-Gg: AY/fxX7hX11iASeInOaE23X78n52yeiU26hV9iMIUES/3fS5NMhfG9HFVKVZS/nlMxX
 gTu9Gb2IjHHsVFtpUo1yS4CHZQD5tYUHov6sNA/m8FLzHNfCRDB/CFhnTb419qe8c8ia1602Alp
 A15zR+kFX9GnE4+aVuGP2uwfPqvjcWs+FaYa6e8bSu+ADlVCcBzuEzedQhqdZL48gOSZGkymLaa
 i22o8ttt05H72Icah7YMAHbTPYwEfHI9iHua1GUS1gH8oLuszyzjcBaITtNVOcvcEJ2maiEfa5D
 utKvrZfH1z6+F5F6BUqLiATrTCWwKeihq/2KJiblIMmuDdYbJVx7jnZW63G6TlAZ2BCUUI8mVVQ
 SFR/64Ky2askCeQLtvlvqZ0yc49+1st1g5fvC9ln4dz8fRZGgMbAFig/3U+JMKmNQXBqJfEy5kk
 my73LzGR2Q4IMWQVEvgF2ZE54=
X-Received: by 2002:a05:620a:4802:b0:8a4:e7f6:bf57 with SMTP id
 af79cd13be357-8c389368bbemr2941977585a.5.1768263889558; 
 Mon, 12 Jan 2026 16:24:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEyjpi+M7spreDJMit+P3ck5UUiEC5t+Si07Rff8PFo3t5TmSHbXB39Wl8TRKez4c9R2Z2VvA==
X-Received: by 2002:a05:620a:4802:b0:8a4:e7f6:bf57 with SMTP id
 af79cd13be357-8c389368bbemr2941974185a.5.1768263889102; 
 Mon, 12 Jan 2026 16:24:49 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-382fc17b990sm33674221fa.40.2026.01.12.16.24.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jan 2026 16:24:47 -0800 (PST)
Date: Tue, 13 Jan 2026 02:24:44 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-media@vger.kernel.org
Subject: Re: [PATCH 02/11] soc: qcom: ubwc: add helper to get min_acc length
Message-ID: <spk2wlfjgrtvkbxk2rzklsdg7ojpcsehl6c5fzaergrq2chpcs@p6s7px3lrtt5>
References: <20260110-iris-ubwc-v1-0-dd70494dcd7b@oss.qualcomm.com>
 <20260110-iris-ubwc-v1-2-dd70494dcd7b@oss.qualcomm.com>
 <5594210c-ce25-40ac-9b5c-69c97eb0bd72@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5594210c-ce25-40ac-9b5c-69c97eb0bd72@oss.qualcomm.com>
X-Proofpoint-GUID: 4M5gnoHATIvBrjTcQHGPo4gdzd0zFa7e
X-Authority-Analysis: v=2.4 cv=SK1PlevH c=1 sm=1 tr=0 ts=696590d2 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=V2uskYJtpVaDOKukMOMA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: 4M5gnoHATIvBrjTcQHGPo4gdzd0zFa7e
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDAwMSBTYWx0ZWRfXznpov37mdmws
 +kuYNxi3AaNQKfKfhO2NhU1CMT8nfkATIs5oD/tr08QxMiTlIcgvI0mG0vfDUTNOpDFCJLFNLFq
 kXzxXbd/Amn9CQ6Cz/3DOUa77PjROJK6I9asyICOka7eGLtAgsWUAMH0a/dH9UlHriUU58iztGw
 0ld38OAoNvTNmO4Jt3gTWeSV8Dr8gcdJRgmHN4pPw4XItMiEiLz1aIfSpWnCOJp9lDAyz6iXyi3
 YjR/ScMOZHqRxzgRIiRcq5GQVzMzvcP4axLiGw2B48+rSELIbNEYeLk8OjNBdlYXCDVvgHPJyvt
 Voc039buBEpC4jjXmhzKK5a4DBr38/rRTrjGIAp+F8y5IaCSspY/RstVc2H5DHOyv1+y6C8EwSU
 dewTRcSSQY4D4zoPzgRNn3IZvLoj4t47arrmC/CbuTbbVkfPi23hqduhGi0WZBBFbfcmpUqlnch
 zayre68kZwXbD9YHeeg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_07,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 clxscore=1015 adultscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601130001
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

On Mon, Jan 12, 2026 at 12:08:13PM +0100, Konrad Dybcio wrote:
> On 1/10/26 8:37 PM, Dmitry Baryshkov wrote:
> > MDSS and GPU drivers use different approaches to get min_acc length.
> > Add helper function that can be used by all the drivers.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >  include/linux/soc/qcom/ubwc.h | 7 +++++++
> >  1 file changed, 7 insertions(+)
> > 
> > diff --git a/include/linux/soc/qcom/ubwc.h b/include/linux/soc/qcom/ubwc.h
> > index f052e241736c..50d891493ac8 100644
> > --- a/include/linux/soc/qcom/ubwc.h
> > +++ b/include/linux/soc/qcom/ubwc.h
> > @@ -74,4 +74,11 @@ static inline bool qcom_ubwc_get_ubwc_mode(const struct qcom_ubwc_cfg_data *cfg)
> >  	return ret;
> >  }
> >  
> > +static inline bool qcom_ubwc_min_acc_length_64b(const struct qcom_ubwc_cfg_data *cfg)
> > +{
> > +	return cfg->ubwc_enc_version == UBWC_1_0 &&
> > +		(cfg->ubwc_dec_version == UBWC_2_0 ||
> > +		 cfg->ubwc_dec_version == UBWC_3_0);
> 
> Are you sure this is a correct heuristic?

No, but it matches what we had in MDSS driver (and I think it matches
the chipsets that were selected by the GPU driver).

-- 
With best wishes
Dmitry
