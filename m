Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5000BCD33FC
	for <lists+freedreno@lfdr.de>; Sat, 20 Dec 2025 17:52:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE75810E241;
	Sat, 20 Dec 2025 16:52:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Lew08moB";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Lb1V3Nji";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70B5E10E241
 for <freedreno@lists.freedesktop.org>; Sat, 20 Dec 2025 16:52:09 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BKCUH1b3941953
 for <freedreno@lists.freedesktop.org>; Sat, 20 Dec 2025 16:52:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=md820MSJFmMhxzBhoy9K+H94
 1G1BAf7npRq1mwTR9kI=; b=Lew08moBKmsRyNrL9SesOrsXUaVNS0HMRZ6xjred
 dIzNReB6N8e/4pAtN4YPXoTQR6By4GSvBp+61ubKABL2PmWQk8+SR8swpBmSHbbN
 QfhgGr2697eMHBLSs9TYNAcgC4U0NpgdgYk+WGPCRM7EFJgoHyX2vMCw2Q670yrz
 55yenpkIGWRxOnV9Iei8/HLHV98+BffG+4SdXsVnaEMNkWVkZxXs6YsDYAjRwzJG
 FKrW3pQtblUqMgk3I9sTqH3BU7KD/EZ1GoQ9c4styrV2QeWcVr8TASDSHVs1umf5
 Kl3UQmcl0aB5ulsv5svVbeRcjyyTFsiVvVy0Ifs55vncAw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b5mru1075-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sat, 20 Dec 2025 16:52:08 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4ee0c1d1b36so83594311cf.0
 for <freedreno@lists.freedesktop.org>; Sat, 20 Dec 2025 08:52:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766249528; x=1766854328;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=md820MSJFmMhxzBhoy9K+H941G1BAf7npRq1mwTR9kI=;
 b=Lb1V3NjidmLlNxT4Al+0+H7CMopsjx9YVdnsWq/zHpLyoOxHdTn1wRjTNJLxS4gOXj
 Jf6F8eYTtGaJAgt1RFmFCDpNSgeIZHq8qHx8rPaKDqMGJURC3f1/UfWlcFOV30wCik3v
 yXWD28p2xHl8H9A2tOLVd2T8jiIG2L+wVnm5oPOMTBUBOBWzyC2qWN/muL3Zao19vl3x
 Ss1RHdePONPry1H0Kb6RlHUZNHZKV2/7KxHNiCrBYCM220WJfvHmzClq8I1SEsybxe0D
 wqszm4RMTc2dkl76wBhlM73bhOXxhll8AxjUd2ThdLaXF6EAuBaRPiQCG7j0Qvux2J7k
 Fjkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766249528; x=1766854328;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=md820MSJFmMhxzBhoy9K+H941G1BAf7npRq1mwTR9kI=;
 b=gBiAqMOKIG1D7S6iqeBUCfdJ92QWLw/7kFYiyF6EBlj4Z3qOcJA+i49Mm3yvWSr4IN
 IRYMHTnCkfdzFfntYv5XhGzy0Tyj0TeOeRQa/7ou3dseTvqgKD99SgR29T9bh/+X42am
 ttlrIlp8oH3lUIz9FmGs3OwFr+gWhDJzAmdbDNRPC5snsBgq1zKOhQzIBtlLu0udxGP0
 UyK+TljJrkJ4enHlG1aCv3Pm0mRTiMH+/uQIwQm/OLtVmoZWdGgCZ0tjlvwffARBX8Pe
 vCp68YXOuIO67IBLZbUOPho92OchKkVZxdanjQBEsIJv7f9EYyTbuO4ewvNreo0QkUse
 jMgw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXBl+LrXsvjhsjCNgG5os6ogu8/CN3S/fezJoZ+Q5hQfqzmw28yoP4u1Q4t48G5+kMzJG9fgLlyZ7o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw0TRb5WW6hNP/rw1y8DKDummqCKyC1uEwaL45tMkfOiQorqu1F
 CsDk/hrr3q18rB1RzDxj0fy866iqmpgX9CP9NDEXvXom54j70NHZIAOhx88RsOXMCKIgjq87Qjk
 qRmBjxoymygW/5NnKe6Le/TOCl0sobUvXoZXriQtM68KYWGl1UafKWcQXIj4+/LpWlz+xjjk=
X-Gm-Gg: AY/fxX6c3V2win+ZxYeU1YqVMKNEDRxcnCFr5H+uUFe78OYtRNsg0Q4FnoNxY+zjpmj
 GTjtTbRKFHKCyAwvZfnY0RnmQm94/psrVwzI/91WWD/Qv0t1cvr3FOLsrKvaVIkQ8F/2Pefu63j
 oaDd5cwCfc55MTbu8dfGAk4KmU30EjHr053UvkPexH/Mwyj/di6Uz0wFrTf0VAS62bQ5RkAuMN7
 Q/3vDwgnh0aVlw8v8yWSFdW+z65q+Z13rsKQGK3ujppqnljq7t3oNiTRI/ig1Fjg3Uwk0dxONj/
 3aRBwjRMGiaXWlKQymmo2nYFzNtYJXW4kE1e+RmwmHFvCoRaLHu6wwAwBc/Tcgco/swDWwcJUk4
 Q9E4Wll9Ug7UD5WmBjZxxKRP3cXTQbLkoLGUe2+AhuLzZdn9uKlQr8VWML115WvhFJbOphlAioO
 1COtc8BLA5uV0RXQyDYmCHzNo=
X-Received: by 2002:ac8:7f81:0:b0:4f3:4b53:a917 with SMTP id
 d75a77b69052e-4f35f43a9damr148412011cf.22.1766249528044; 
 Sat, 20 Dec 2025 08:52:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH6MpmVZ7ZQhZ40pLdCdrBIOL53YEAOVIlZxLQot31bDGrYAK4K35/1+HqCakHdqkzMA7+JTA==
X-Received: by 2002:ac8:7f81:0:b0:4f3:4b53:a917 with SMTP id
 d75a77b69052e-4f35f43a9damr148411641cf.22.1766249527582; 
 Sat, 20 Dec 2025 08:52:07 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3812262b36dsm13394911fa.30.2025.12.20.08.52.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Dec 2025 08:52:05 -0800 (PST)
Date: Sat, 20 Dec 2025 18:52:03 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH RFC 3/6] drm/msm: mdss: Add Milos support
Message-ID: <475izg5bi56oefqtqkvqeyspx2por66zrw4tgqbb3f2ziaghyt@tccm73sl2u2e>
References: <20251219-milos-mdss-v1-0-4537a916bdf9@fairphone.com>
 <20251219-milos-mdss-v1-3-4537a916bdf9@fairphone.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251219-milos-mdss-v1-3-4537a916bdf9@fairphone.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIwMDE0NiBTYWx0ZWRfX/G4ElKn/LIyk
 P91B6Pk910AOQRQJB/d+fz7PNyhdf4V0RCQ8BWGQ36nneoNfxqBGVGUOAbsXZHNIYBuLMKzWMFC
 RfnpjGBpEZJ8qbcJWzyIKme3feFvaL0dpzsY97HrEbh3qaR0+86x87f3bH4YjmTFmFoDYGw7O/S
 YpeqafFE+QawXOqk6saICFwxpEIJ5KYqYqrkyWys6Kqh/NzUsmGiCXENfWJtsJHBk7iUNLFi86K
 JM7XG+KYE0wbVV/ZwxxsRXRJi+PgU3F8HY7cRhJyR0LwIXKAEk59QGdp0Ct14qkCX6NTXfQv8Vl
 QULATd4HQq/Mwbu/xnPR64gNmRgDEvHiF35rcWK+rZl36qjUmOcJiXlsgEf1NiVdsE9NLsFgqbu
 F/ISCtnBrQc7I/TojsWxOHmXyxmedEzlA7x1Jg2R38shib7WXrT4t2yLgpKAxBJPKMaN0cyV440
 sBbanjuSO++qAW5eGCw==
X-Authority-Analysis: v=2.4 cv=VMnQXtPX c=1 sm=1 tr=0 ts=6946d439 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=Ybx_Rsa12JF0X6GijNIA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: eCfdRh1TLzYx5hKHlBpUf_KwT3QOqPTQ
X-Proofpoint-GUID: eCfdRh1TLzYx5hKHlBpUf_KwT3QOqPTQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-20_03,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 suspectscore=0 lowpriorityscore=0
 spamscore=0 adultscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512200146
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

On Fri, Dec 19, 2025 at 05:41:09PM +0100, Luca Weiss wrote:
> Add support for MDSS on Milos.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  drivers/gpu/drm/msm/msm_mdss.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Though 14000 seems lower than the value for all other platforms.

-- 
With best wishes
Dmitry
