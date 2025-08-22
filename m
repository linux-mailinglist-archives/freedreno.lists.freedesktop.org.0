Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63B27B31583
	for <lists+freedreno@lfdr.de>; Fri, 22 Aug 2025 12:34:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E78710EAB4;
	Fri, 22 Aug 2025 10:34:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="NbJHNySp";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B257310EAB4
 for <freedreno@lists.freedesktop.org>; Fri, 22 Aug 2025 10:34:48 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57M8Uu3W001675
 for <freedreno@lists.freedesktop.org>; Fri, 22 Aug 2025 10:34:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=kveQ+tzxSixYaW9ElHHUjKWE
 uXQ0n186XTdsODdNbAY=; b=NbJHNySp6cGBngKyWzHr7So4mttf5+9GBE3hYVFs
 ZEd6u2yMLX0GIOPRWpZg0P+mTOKlZC69c1twVJFxi4UZ4JMTDfEl1CbY8IKOuhQR
 /azdpfol49X2Vyx6kaZwaxPr4pe1g3MjDloys9oQeyikt/r2p36HX/r1Wmjek2pZ
 RCkZafM7HAjwxsvM15rtswXP1qsP6d6FhDBKHDZuGQoYv/TkuipsJLcNIZ/slQLq
 3YCyx/mrbJCQFqrXw7neMCIYfEVDm92cZR0Lb29VLbOlcvAfG7z98b62y8iEbn8H
 M87g89SlpvBZQBzuoUogJ7QyylEaPwQPASW/1ljOS630iA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n5298wu6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 22 Aug 2025 10:34:48 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-70d93f57a7bso23283216d6.1
 for <freedreno@lists.freedesktop.org>; Fri, 22 Aug 2025 03:34:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755858887; x=1756463687;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kveQ+tzxSixYaW9ElHHUjKWEuXQ0n186XTdsODdNbAY=;
 b=PcALLdUiWQVcaHeQo5aR/kPbejx4YfXWtZ3VVpWpH2b3szvKOOuPsl/f+GoBvw45YB
 ymDvHZX8gKCxbb3XaeoHW6rSHp86xSF9WBcIjZ58jTxcUMaAkE0RTNLATkhrUNFM9WUg
 Ffs8QIFCiT+sU7RKxTBbogAmly7VQE6aW2XOuV+J3fNfF4zKfcB8lRARbUOfpxdVbar1
 h+czA8rGOPIkyadRJKyQJ4FMRs2nuBIWOArDBBtjEt2IkmOSCy/7TdHKcadf9d1QjItk
 ahWLamyPUyNKOEtJfQ6lTlSX8BGDWPnV8EzFLkAs0PGrCdwzrtPtUja7AmQKClHYF2qP
 DVfQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWWtjVppWWx2oDdH15TG1uIxrDsDOnzhcEp80BVaTFCmUh7OD77x8QSkkIlrqkJTnDajKut+vs3T5g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwGJlsi0phI2RllJpWixy35PgUs613WaqEZAY+csfsFCdXYyKtr
 wCtC9ijtOsgiPzJqLcdsoFqXNUeol0GZZLBFcvLWWJa2B+H79Sqar9LVrSZ8G4/CrECmQRUnDeL
 KBUZWRkO6CFEYoVqWqWYigqeH/RwUXWRaIKYw2Aylu+iEXzdZCkuN8kQVbBPTbLk5yMHsJi8=
X-Gm-Gg: ASbGncsmGnCEIIBIaO2wsq8QYnhXxdiKw11hqx+ucRPogYnqaQk3J26dt7RM4CTOTie
 TDd1aML5IEMDt8WvKQ6n2zzCQrldRfxQ86ORT0CrwvlFDoVWM9U4VpIw3OQD+LsuObqxa3rSpuM
 PgWV8U4LKoJjVb/Ub0ZagwHek3chWX4HOmmRtHA9WfQe21pV4C/3JddYjtFy/Uhks0kXtlFrNIb
 qlrJELgHNgIGvb4TXOGrRgwCcEHT4okTVR57/o7hoBsHpU00H5DdekVHjoDWjks+vGUjrNtqNo2
 rLGzKBGf2Lm0b6QmSKGK1nlYYGU+tM9R5bY6VWJIzPto4i0Uo27u+t8vx0obNM+39NrYdiOWB9+
 8okFP5v5bJEdKqIFpd2wmxeS1Zvu9XDl3bwaTpML5xdikAC4wI2jE
X-Received: by 2002:a05:622a:1a27:b0:4b0:65cc:f64f with SMTP id
 d75a77b69052e-4b2aab3c33bmr22432821cf.54.1755858886918; 
 Fri, 22 Aug 2025 03:34:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGitENoH3QIhDfrMsc85KABpbqP+cmpwOZOUhVCbOkZutTUgU8nZ46PieBebtYJ+AhzzSGsfA==
X-Received: by 2002:a05:622a:1a27:b0:4b0:65cc:f64f with SMTP id
 d75a77b69052e-4b2aab3c33bmr22432591cf.54.1755858886489; 
 Fri, 22 Aug 2025 03:34:46 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55cef3513c9sm3554851e87.29.2025.08.22.03.34.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Aug 2025 03:34:45 -0700 (PDT)
Date: Fri, 22 Aug 2025 13:34:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 5/6] drm/msm: mdss: Add QCS8300 support
Message-ID: <iza3iyj6ztuudm5rqfrxtalwxfghzsguf3pieulylebdblq7sw@divpjvwwvmsg>
References: <20250821-qcs8300_mdss-v8-0-e9be853938f9@oss.qualcomm.com>
 <20250821-qcs8300_mdss-v8-5-e9be853938f9@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250821-qcs8300_mdss-v8-5-e9be853938f9@oss.qualcomm.com>
X-Proofpoint-GUID: z4-ihAMxLZj2OPKdSUz-DVywgi6yAY24
X-Proofpoint-ORIG-GUID: z4-ihAMxLZj2OPKdSUz-DVywgi6yAY24
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfXxjWmrN5zLLBM
 Cnpy9gwWG30NH7rPaZvrly/snma7xQdJYtc0xU5HRhAw2tMkDLvb1uGEdKGX07omryhDFxpbpWi
 D25AT0ZkOpbxzDESVARAJJc5MN6DFlwNUNk3yGhwJjHGn4psjn5rqoullKIK+N2cU0q1YzzhtTH
 ozzTrP5iENLWK94PXf0qvCqiEErj6FJXLKTRgRPRiqR4tP6tCx2mIQSanGu0lNKcDT0hS6zpzvS
 Hq8tW9qp6yejmndHuHmlcPn20zWZu+2RQZceb9uqZoBfaW9VcUMXBmYV7z+w6rPk/v1fLLMxoc7
 DjTRnWmQf7iq8j7gw8hXWd0Ezb9gR9fdeIfb+Lhv2XLZNkWH9qbUTHy/WJY0UrCnlXMVsEQHlHa
 RrrsKAUZYo6zT1cyVQlGzZkUe3keBQ==
X-Authority-Analysis: v=2.4 cv=SPkblOvH c=1 sm=1 tr=0 ts=68a847c8 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=PV2lBtblPjvqxubg-rEA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_03,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 bulkscore=0 spamscore=0 phishscore=0
 impostorscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013
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

On Thu, Aug 21, 2025 at 11:36:00AM +0800, Yongxing Mou wrote:
> Add Mobile Display Subsystem (MDSS) support for the QCS8300 platform.
> 
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/msm_mdss.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
