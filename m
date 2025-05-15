Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1C52AB8B7F
	for <lists+freedreno@lfdr.de>; Thu, 15 May 2025 17:52:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B78C10E903;
	Thu, 15 May 2025 15:52:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Lrxfj1VC";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB08C10E8FF
 for <freedreno@lists.freedesktop.org>; Thu, 15 May 2025 15:52:37 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54FEFrL6027175
 for <freedreno@lists.freedesktop.org>; Thu, 15 May 2025 15:52:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 PWMmFCrAfuYggrwFp3r2207gsXdzwcTP1brIqToPnVo=; b=Lrxfj1VCnnKJH6aB
 LQGvZdV0KHsUgasZWpTn7gqQwlr2iEZ2lQ6Wn3SKdE2Ffmnf0t3voK4DOXDjzbmW
 /G4EcgS6MYXs9xZWLY+Uu+SBzNgolAILHYuO2F9QkH0ZUYxP2PP77ZiLgy6wbrpl
 2DzLo7aWfWIuFnJoD5eUXUQUhTq9x1rN6gmrVBeoovEqLV5elpQmp2PpE20eWru0
 xgE/ItC1QDhn4MvwMlFeMDSMQR/w+4dzXaW7tYT+Kb97dkznYYnnDvgEYsY0YnzQ
 PyFjYiT2SJE/2lbo0HbOUWODfIw3SXofdDDYwRIJ2hgGMKLFefCyvekAIJiQgHHj
 4DEV/A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcyputf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 15 May 2025 15:52:37 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7c5466ca3e9so24803785a.2
 for <freedreno@lists.freedesktop.org>; Thu, 15 May 2025 08:52:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747324356; x=1747929156;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PWMmFCrAfuYggrwFp3r2207gsXdzwcTP1brIqToPnVo=;
 b=KkkRJBu5N+uYGftTHYySuBpnFLqurzV9ptanpLaopH4DeQbMQXxR+TixNSsUuGatyr
 pyrIbUBNX3MuezpbXyyf9dxp/TBNW3a1CRAJDpy/NhZ7Hgywnyn0f9qsaBK7NCuGac9P
 MBGltuOx/7CIMf93cZk6k+Vwv8bOR28o9iOaVCEcC7EsC4YGZ7lyWQUza0Mba7/uATnA
 o9FfiheiXpEbBqxIbl8Cd4cyShdGN7a+/syX0I3RBHztAUZkgRUJZSEDAq418c7mHgYU
 Oc61LzenrTEeRh3ko+k6w7YqZJbScb16f3CB6lgz+0aO/h3SENZ2rrjYneT+BEnnAveL
 3dsw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXpOwlB7iTbHE+0kvoFB1ji7cBWJ4SiiKusyJvzTnWh7H5Av/bexhvXvlphDqv20dAegS3RmgHJ3qQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzB/H62D9aa+lq3akEp6j/o4upaGI2Z34rsHPaIpdgbtGBQSp/V
 MuczJokdihSaXX6RJ/djoAL25M1zbfbUrZRUj9r0gtvPmV8TxPsHo0Lfxq/Ca9HIYFYrvEIJBtW
 nRMY9K9rLiaJGNbDkzA+YnRRIV7MH9/LTiAeo9eMx9WJujumgYNzaG5kT7w1fZ5+QNMbgca4=
X-Gm-Gg: ASbGncsbr4BJxncLDUnrFeemLYGZ2FRVDt273wG+rrICOp39UOoInTMVPWimn/Y87QJ
 Kj6f+3/s/CA74pYcLPpx06agleLdc1RfW3XmfKI/xbMvOZtT5HCo3MMcLp0MaFbN61C60pqeBGZ
 766hXkLkvoju1jhcWySAxgjCeuv8ysdpvaf78ljhdJcGNh5Ls+y2RHaoHprq2mDYYGI0F9IEqS4
 Ag1zIEdm5ep9WZeklm2r+vHYHWqlDt2PBIOXTQg865a3Ua90+h5iElDAqXZu5oJr8auKgBK5OZk
 5L1d0OiPLJG3KJ4UAKzReg5T3u0/WsSwvJ47jbo3VZYotMQqdHZxelrNohTrWkFzsQ==
X-Received: by 2002:a05:620a:26a9:b0:7c0:bb63:5375 with SMTP id
 af79cd13be357-7cd4673b3f0mr1354085a.4.1747324356126; 
 Thu, 15 May 2025 08:52:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHrFV/2EQXmPxJircJAV7XiXDHBdvEj6UPYt6UTWF/ixiBBQlETA2RLAhwfWdEO68zo3VBYbQ==
X-Received: by 2002:a05:620a:26a9:b0:7c0:bb63:5375 with SMTP id
 af79cd13be357-7cd4673b3f0mr1351285a.4.1747324355750; 
 Thu, 15 May 2025 08:52:35 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6005a6e637dsm27454a12.43.2025.05.15.08.52.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 May 2025 08:52:35 -0700 (PDT)
Message-ID: <a068ae00-fca0-4c53-9b59-a855caca12a9@oss.qualcomm.com>
Date: Thu, 15 May 2025 17:52:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT v2 12/15] drm/msm/a6xx: Drop cfg->ubwc_swizzle override
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250514-topic-ubwc_central-v2-0-09ecbc0a05ce@oss.qualcomm.com>
 <20250514-topic-ubwc_central-v2-12-09ecbc0a05ce@oss.qualcomm.com>
 <3uflij5hthurgt67rdnfhqtcoconybsnykirrwnk7idtz6672n@26qdq2e2ehtz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <3uflij5hthurgt67rdnfhqtcoconybsnykirrwnk7idtz6672n@26qdq2e2ehtz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ecfO7LiAmOjhqs_4diXt7YMlK5VfezXx
X-Proofpoint-ORIG-GUID: ecfO7LiAmOjhqs_4diXt7YMlK5VfezXx
X-Authority-Analysis: v=2.4 cv=JszxrN4C c=1 sm=1 tr=0 ts=68260dc5 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=jslb4AC7pnrZMK7c9NUA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE1MDE1OCBTYWx0ZWRfXxZn2yQPsqxni
 KOj7qLsHN/laaJaxUsfgYTCYbMAz/Nn6mcXlsqc5iKBwg00ngQCtreDsQi2rNzSDGOBKuIFNFyR
 SYbObFf2mpqbz2ZvL7bZRj+z0EEMMbTxcZsQE4f4wBhWUy8kZ61G3xadDaxABiDVD+wMq7hu1RS
 J7P7j8axMckdlRyOPjmK4REuSc3MWotIQu2nN1VP9fO/hW6HbTF1LpYrcgznk1awU7+dj4eVieE
 Ulyfna9WckVwRW6rRqWUzOc0wrOQL2VNuytxOICjaEWAY8+Wo1FB63wi7WP1xmKWw2D76/onxmj
 opEJZ7nTbyNboEflsogfUKp+X+ouMl9hFB7YJTWPlAs5eVhTeBhLAvv9HXHIdsFK6g9RKNY1Gn2
 J7y7Hxwe5hXb1pk9sdF1DOqhDa6F8Rg6vUNQUPfibsuryaP7s0Iez6IU7sHSzxa/1dRK+mfz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-15_07,2025-05-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 mlxlogscore=755 bulkscore=0
 malwarescore=0 mlxscore=0 adultscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505150158
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

On 5/14/25 10:32 PM, Dmitry Baryshkov wrote:
> On Wed, May 14, 2025 at 05:10:32PM +0200, Konrad Dybcio wrote:
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> On A663 (SA8775P) the value matches exactly.
>>
>> On A610, the value matches on SM6115, but is different on SM6125. That
>> turns out not to be a problem, as the bits that differ aren't even
>> interpreted.
> 
> We also don't set swizzle for a lot of UBWC 1.0 targets (as MDSS wasn't
> programming those). Should we fix all of them to use 6 by default? Or 7?

I don't think any default value is a good idea - this is the sort of
programming error you track down 4 years after you go bald looking
for it

Konrad
