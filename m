Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAFA4AB136E
	for <lists+freedreno@lfdr.de>; Fri,  9 May 2025 14:31:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A65210EA33;
	Fri,  9 May 2025 12:31:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="TD0l2v+h";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7465A10EA33
 for <freedreno@lists.freedesktop.org>; Fri,  9 May 2025 12:31:49 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 549C24aJ016832
 for <freedreno@lists.freedesktop.org>; Fri, 9 May 2025 12:31:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 EbH4xkJ037sHmWJTr5Z6OLwNV9LiRqfb5T0r82ilyRo=; b=TD0l2v+hKdxbfgVb
 /RivV6WcujA3/LpI/T7ypy1YKytqRt6KRVq91exRPZb9sOjot68avQj+C/akVD97
 uenXZvm+8eiehYGhK7YvMmKup1HZokDrZBUNlLIRyXJ/g8IZndTfsKkZfMitrvp6
 5I3luqaXB+BAyWydhTVZhwHlUfNysY281JQHmTP4jWCaWEafW/+tWJPB7l8kF/0f
 WeFE+zM23dpTujtVKqSI8wA0PT8y4+a9mo4YcGfqfLS59ETmiHDFggq7ObqkcMHT
 2vgH1Ke09XA30aMtDDH3o7I+3H1MqjYPNqNrCelpR/Zsw+nFTA7X51y6NF/Tfg9P
 gGMjjA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnp8vkwa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 09 May 2025 12:31:48 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-48f812db91aso5218981cf.0
 for <freedreno@lists.freedesktop.org>; Fri, 09 May 2025 05:31:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746793898; x=1747398698;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EbH4xkJ037sHmWJTr5Z6OLwNV9LiRqfb5T0r82ilyRo=;
 b=ScL/QG4otDjQ8GSd8nIZ9RBoi0CU9n3kHH1/uv3BP/i/YlaJqIWO/7cXp1myrCVnQt
 3EHbnYcLMM+xvilHPTacLNJKcyIItEZMfFw9fNf2pr3G6Ts+07WQwF9lYK6GDPUFmWnQ
 KRbzOp5+Rww8hOC5AvDNX5+0S1qx8Znd2Ex1mSO/is8MPIAjsSwrSGzmhGg4GlJIkuNV
 bzHnbaJ3V0IV4hMeGDak/Zqu9zE6TsNY3uXQpCCO2eniPHc2tVtgTWmJl0B+Q7w0Bt1t
 BrviK6apUX9vczhw4kAqNQZ67gU3+lo+DuZyaDpadjc65VYL6iAK2M2zCgRnNijVql/w
 oMaQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV/bgKYKwoLympVNHjQCKZJoeRD6guQXar1EPJk00iWa0yw7lmsGhuXILy1WmVMRo9Klp8Ks5f27yQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywm90Ck9lbE6lInZAR4hFLnpDuDiIUp7/Mi6XYfQIKUH93g8I7b
 QG4Xj23p3emV4pacAMyuBHav7fnp2p9nWhjkHpHZFwsKo6Oco8o+A2N3Fb5Q2Dhjt5MHkTyfFGg
 ymC5rs7qoRCmTgNLdZw0dYHaDOW+Xt2izCK2uebudpPmdzgRpzsVrZPwYHhU2Ob7mPlE=
X-Gm-Gg: ASbGncsFxhGLACZNJ7W73AtWfHdAz9BHcDAMWOWlHrShf0Ba9dL4T7U089SKHXLZVGa
 KB7xH0Lif8EJobpKivWu3sT+gRD0pig7zcYexuz8sy8artMYaW5ZQ35H1gvlSK12+Gs4jwQ+WqO
 D+3MFpl5tJyxhP9MK+8fMeDMwFLxpQPcarwdWCH6yEM1hGFiz2V+S54gQt01ovQk/7VD0kzO9y5
 B3/FuHc2ECJ67cjUv0pnUUteGj8S5WynsDMNVMhRfDOTxmAuPHSa54AMCOfqS4SZf6Zuon+CkBO
 S6tWQGKW4yrFgRkqkxK4yuzRJuTtVHEraR9WT1LwHkXPpZIu426ZoySSNjxnAaK0LzE=
X-Received: by 2002:a05:622a:15d1:b0:47a:ecc3:296c with SMTP id
 d75a77b69052e-49452621f26mr19121121cf.0.1746793898383; 
 Fri, 09 May 2025 05:31:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEdKIea1lSY3D/Rfo8iAPuqf50b+VB1CNMxYngayS0dUO+pp0Ywod1/ouLGCtIY6ZrJN13yJQ==
X-Received: by 2002:a05:622a:15d1:b0:47a:ecc3:296c with SMTP id
 d75a77b69052e-49452621f26mr19120871cf.0.1746793897859; 
 Fri, 09 May 2025 05:31:37 -0700 (PDT)
Received: from [192.168.65.105] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad21985b026sm142384566b.177.2025.05.09.05.31.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 May 2025 05:31:37 -0700 (PDT)
Message-ID: <2cb9a1f1-7283-419c-937e-5eecbe65f982@oss.qualcomm.com>
Date: Fri, 9 May 2025 14:31:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT 05/14] drm/msm/a6xx: Resolve the meaning of AMSBC
To: Connor Abbott <cwabbott0@gmail.com>, Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
References: <20250508-topic-ubwc_central-v1-0-035c4c5cbe50@oss.qualcomm.com>
 <20250508-topic-ubwc_central-v1-5-035c4c5cbe50@oss.qualcomm.com>
 <CACu1E7GrdS3m0fLcnOW+v-nkzRveXrzVw9PzSb01duYx1aifSQ@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CACu1E7GrdS3m0fLcnOW+v-nkzRveXrzVw9PzSb01duYx1aifSQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: uJ0uPBBl8OPTGZ-G4j5R2-4-qBspG_HA
X-Proofpoint-ORIG-GUID: uJ0uPBBl8OPTGZ-G4j5R2-4-qBspG_HA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDEyMiBTYWx0ZWRfXxt7bebzrIbQ8
 UWw2anKio8y32/LViUz5RCcmBa7I74uaV2Gw2nvwT+PyBcdH2j9vZQ0Z4px3iWYY+NUHJblGy4O
 Q21q7//Xyc1d5avZnDJ46j1v4j8IOjA7M634CToQEkxbxH5vi5eu4diaERX/rgjJcwqXuskNznA
 EoVxHsCxANtXc7InTCNJuxI6AQ9pUxqTHzNKh/UQ2Hk9lH96q0pOvajuu5DEtj5iiGkLc/RurY9
 XqT2MZN6B2GPeBYzQxAGkLZLrzKeweThqRUdO+Mk69V1WjtAhD74orbdjoAuGXKpzeB0rGl+WzQ
 7WsnL3v2KEIuh6INAAzUnjw1P4kfZ8KQtUf2XsEd/jvYID5h5lugJ+VvWKS///pbkPHikVHuDRz
 Vi8HRQoZ4+sB5CnolU2SIzsSX25PUAUtKIoHPD6ny9ypmi3fPY8hJl3r/wSqbVN68eqfDqnH
X-Authority-Analysis: v=2.4 cv=e/4GSbp/ c=1 sm=1 tr=0 ts=681df5b4 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=RZUx41kZHZKgpNmG730A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_05,2025-05-08_04,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 phishscore=0 clxscore=1015
 mlxlogscore=841 spamscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 mlxscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505090122
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

On 5/8/25 9:16 PM, Connor Abbott wrote:
> On Thu, May 8, 2025 at 2:13 PM Konrad Dybcio <konradybcio@kernel.org> wrote:
>>
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> The bit must be set to 1 if the UBWC encoder version is >= 3.0, drop it
>> as a separate field.
> 
> For these sorts of things, it's probably best to add a helper to the
> common ubwc config header. Other blocks also have bits for enabling
> AMSBC and similar things that also need to be set based on the UBWC
> version.

Good idea

Konrad
