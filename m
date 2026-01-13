Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09A37D1A62E
	for <lists+freedreno@lfdr.de>; Tue, 13 Jan 2026 17:48:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD44C10E514;
	Tue, 13 Jan 2026 16:48:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="W5bbx3dG";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZAFOLISb";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4BDB10E513
 for <freedreno@lists.freedesktop.org>; Tue, 13 Jan 2026 16:48:29 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60DCqkdo3735288
 for <freedreno@lists.freedesktop.org>; Tue, 13 Jan 2026 16:48:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=zm7s+brPb7rRGSHomukVRPI+
 rYMqYiyT8iaPOnZMWIQ=; b=W5bbx3dG2qXfoxB7cJxfSLufnzaPPNgVXFq+Pisp
 v4pndINFnaelkUcTYOVdts80yFSQn6g4PDQjlxYCIJAvoc79lTP6qaZsjDSDECrG
 AnWN72V8+fPS7Fj9DhTeu5ZHVmmZuvM0ucQccz+R3BRFj5lytJczohI36J6A2l5L
 j3GQ0+zsp2Y99eubmRmKjQ28QRtP8ZQ46hjLmqEAosIjDaM0ZERMQ8zjs+Z7Bu5H
 stKto/GQjnhtglQ38B+VmEjHGGqEc36vera5I2s1eVCO6vvvbshu3K5eEzyhlFtu
 MAD4zrPSxPFiKoQRhxt9qUUkKzLzSgOhY4youiwHtiXxdQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bng87a2jv-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 13 Jan 2026 16:48:28 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8b2e235d4d2so3025793385a.3
 for <freedreno@lists.freedesktop.org>; Tue, 13 Jan 2026 08:48:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768322908; x=1768927708;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=zm7s+brPb7rRGSHomukVRPI+rYMqYiyT8iaPOnZMWIQ=;
 b=ZAFOLISbewKCva7SUIF/pepdp5XEHEMgiWkJclEkl3+cmwprmOzfFpEtnNegvb2fmF
 i6YqcrYIIV1spUrY3ldXcshB9o7oI6b428dqn/R52wMxeXZ9HF4k76zyp4KpwzN6YoFe
 dLD0M0IgkzjvdiAERq1SAzPHZIZf9FrDlWa8kJvJOZg+T4ODAA+UcyKdCkHbj9vVISKQ
 KIl8hbkAX43x5zORxr1uNPmTg84IWXEyRTdIgcvYQIuYQzco5xM+hPcwUpB24peEPPMI
 FL85nH0jC5azFB1meOCR/V4n1OEgYx2XYVWQU7//TDxYPhso64imVB+Qnp7vXQtrWrHN
 5dig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768322908; x=1768927708;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zm7s+brPb7rRGSHomukVRPI+rYMqYiyT8iaPOnZMWIQ=;
 b=E4KLd/TWI8LM0xTLNR1l/5MvSNrDmOapCExCcnBl5OGeu63QOgEF/WfZsgRxkwZpNA
 vUD6HLF6H2esRj+3AznsP0A1DvaXTo5s972H5mVS7RLYyw2y2lPHQoEqfMewlaTVEmKF
 sX+VGWLP+q3erbwgRS/LJVlpyD/GwbI9m4FmKibxbvXu8hRxPWJg1lmI+5H2MJIKWPfq
 kwBeBk5lLnjMrZPQ94AZynankWj7ps+7gsQQ2Fe3CemayIEIE0Q3YTEtl9g2kho2x7bh
 jjgjuq0uHHyP1mBvE+HM6giuq06Nhza+QLWW9oT9KWDccow94DdqbGWxzt8XbwRzWug3
 ZjAg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWG8XIGTZDArI79JITsp8FNIdb1nDn1wi5wje+NBfWN2wBPzZQS0/RaG3ABc4HEu47UCEHnOAs+dDE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzuMzCgcxvaxe/dhlJ2zKJ+myIyuLvajaOhX+BPlrlBYXXsGkDm
 5A3T8RXTXMB4N2Rx1pw3znftY5aufOtFjzYlaGQjWInKKvyZXWBpDzUWT8PCIC59RA1vSKOnoEW
 ShWaHBFeW+0JnffmK0L7XEkDSUH3mNdsBu52P2uWsAwmsweQTViFhmU4Ef8fY9RYluCYF/TM=
X-Gm-Gg: AY/fxX5DoWzyosgmRa9bKJBxdTiOXJQOUKwcre40fJTvRio+s1maqiRh/jAIra16qAo
 Eyizy/Mp4pOC87wQInnqG24RwMmm2+LvvcBpwW3ZX2LuA/NpF4Q145UkENajETMQt4+7uIksz6J
 oAXTS/PeZ3USjLI8+c40TPYgzKkhgazZxoCKxY/UhP4sYkzLaoHWuxozLZoL9qdWAVt+vPlyMXF
 sMpQtAG/s9JAjwDqsyLChbO0XUcu5puE2aW03gAo9yKYQpNwHJGGpA2lMrtXJPzKgWJDuJN5aYm
 Eg+ZRFAkT1eaVW1gidMF6yXULTrTdNLngIycyX8TGFplRTBpB/ueAVkVz6/cw2N1ia455TXEt9g
 P/BrzfmrbG7UekJwNeo+E/LOVmlRM+NG8xy8GmmF5ox5Ehabn9gSln3tRsom/fgAu1M7BIaOREB
 4oXNGgJ2KALjcTdVB6Ufzre7U=
X-Received: by 2002:a05:620a:4443:b0:8c0:ddb4:2141 with SMTP id
 af79cd13be357-8c389395469mr2988547385a.24.1768322907976; 
 Tue, 13 Jan 2026 08:48:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG/ExUCSPgVzvvxOPEhYjHCLUFmb/vE/0vCZKgFAvf8K/jL9x4lsy+VV+V3Q1Gxgy8LEW6xYQ==
X-Received: by 2002:a05:620a:4443:b0:8c0:ddb4:2141 with SMTP id
 af79cd13be357-8c389395469mr2988542085a.24.1768322907555; 
 Tue, 13 Jan 2026 08:48:27 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59b75ad8b46sm4370152e87.79.2026.01.13.08.48.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jan 2026 08:48:26 -0800 (PST)
Date: Tue, 13 Jan 2026 18:48:25 +0200
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
Message-ID: <jimbmen2n3vdlghrnnuyexeeqwirjxxxye5joh5vvjgggxwg25@yal5suwpkh64>
References: <20260110-iris-ubwc-v1-0-dd70494dcd7b@oss.qualcomm.com>
 <20260110-iris-ubwc-v1-2-dd70494dcd7b@oss.qualcomm.com>
 <5594210c-ce25-40ac-9b5c-69c97eb0bd72@oss.qualcomm.com>
 <spk2wlfjgrtvkbxk2rzklsdg7ojpcsehl6c5fzaergrq2chpcs@p6s7px3lrtt5>
 <e5472469-84be-4ae2-97d8-6756f2cb1a55@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e5472469-84be-4ae2-97d8-6756f2cb1a55@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDE0MCBTYWx0ZWRfX6b1DTF8kGeTI
 4xINwN+iapAFKl7/df6KXDMIuOxX5yb/klFu+ln2SLkEYF9Zsi5fi4lSY808IKVQW2009eWEsnK
 WPswi0DdQ7pabeuSzAGAikjXFaXeZ8lyXl0S2qcsyzeBLTr9U2Yoem8vG5rtFv9fzbbLTTydW5U
 b7RNtgBvelv8yG65cJF/RNLF+jGfAuU1NqzWf6gKyEf1pLZN9rhncAbG/g2n2yR0O4Bn5JKvudU
 01g95GoxpF56ZjUHkoFN0FRmc72laGWxBwNX+sO1IQfC5grZ/M/2ULRptIzZR8Hujthl/KB0LaO
 E+i0ojwZT20UangjsurQEgDpOZomB3S3JCNwDUXQ68PLIaCI7jfVjpQUWlmPyJvEslTNxGf7HD4
 EUqe1u8DXxpHWn2EV4bkyaUwI6S8hvgfPhmBv0sNwTRbAEadtIpnVBVPpyRKtiYTXzMWqCbDIgV
 Xhidfq2d/mopOfjP9sw==
X-Proofpoint-ORIG-GUID: ACeQJZUSUMnOHs2h3yQpVmSr9f-fzuG0
X-Authority-Analysis: v=2.4 cv=IOEPywvG c=1 sm=1 tr=0 ts=6966775c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=gylY1NlVxpGO7Vunac0A:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: ACeQJZUSUMnOHs2h3yQpVmSr9f-fzuG0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_04,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0
 priorityscore=1501 clxscore=1015 impostorscore=0 phishscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601130140
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

On Tue, Jan 13, 2026 at 04:26:50PM +0100, Konrad Dybcio wrote:
> On 1/13/26 1:24 AM, Dmitry Baryshkov wrote:
> > On Mon, Jan 12, 2026 at 12:08:13PM +0100, Konrad Dybcio wrote:
> >> On 1/10/26 8:37 PM, Dmitry Baryshkov wrote:
> >>> MDSS and GPU drivers use different approaches to get min_acc length.
> >>> Add helper function that can be used by all the drivers.
> >>>
> >>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> >>> ---
> >>>  include/linux/soc/qcom/ubwc.h | 7 +++++++
> >>>  1 file changed, 7 insertions(+)
> >>>
> >>> diff --git a/include/linux/soc/qcom/ubwc.h b/include/linux/soc/qcom/ubwc.h
> >>> index f052e241736c..50d891493ac8 100644
> >>> --- a/include/linux/soc/qcom/ubwc.h
> >>> +++ b/include/linux/soc/qcom/ubwc.h
> >>> @@ -74,4 +74,11 @@ static inline bool qcom_ubwc_get_ubwc_mode(const struct qcom_ubwc_cfg_data *cfg)
> >>>  	return ret;
> >>>  }
> >>>  
> >>> +static inline bool qcom_ubwc_min_acc_length_64b(const struct qcom_ubwc_cfg_data *cfg)
> >>> +{
> >>> +	return cfg->ubwc_enc_version == UBWC_1_0 &&
> >>> +		(cfg->ubwc_dec_version == UBWC_2_0 ||
> >>> +		 cfg->ubwc_dec_version == UBWC_3_0);
> >>
> >> Are you sure this is a correct heuristic?
> > 
> > No, but it matches what we had in MDSS driver (and I think it matches
> > the chipsets that were selected by the GPU driver).
> 
> Should we keep a comment that this is a best guess that worked out so
> far?

Sure.

-- 
With best wishes
Dmitry
