Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CC2EAB771F
	for <lists+freedreno@lfdr.de>; Wed, 14 May 2025 22:33:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78DBF10E73D;
	Wed, 14 May 2025 20:33:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fonrt5dx";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8949C10E73D
 for <freedreno@lists.freedesktop.org>; Wed, 14 May 2025 20:33:26 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EJd7sO025477
 for <freedreno@lists.freedesktop.org>; Wed, 14 May 2025 20:33:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=dRKzmwRDtNONnFtD+GVYYT/F
 68o9yjtA9WFV64BwRvQ=; b=Fonrt5dxtERAHoX+tk4nVcXN0KbJukF0i8LppNj8
 BiiDSM2ha0u32DOZgPVwFc4q+5QUKgVxB7C+TqRcNHBeqyI/0MJ3ZC1SJ+VF32nm
 lIzXZa6eze32HAtcYmhuqfLo+z5RPR0w49fdVo035mksSwAxbSAVxmnF7F583VTA
 9G8tDkdTF5ueqE3Gonx25GL4ekwcqtRiTm83oUZzQdTvM6yGErODVlYfscips3Kz
 F2J/OwsqeWVGBba18/Ldn3v2aO6nSXAuiFFbSDUC8wTAtmEnjLpFESa33Ho+ANlJ
 K35mkOngTMGL3IHCyzr5IPbutTfBWDg7W5gbx5cWh3vRIA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbew3wyn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 14 May 2025 20:33:25 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7caef20a527so51590585a.3
 for <freedreno@lists.freedesktop.org>; Wed, 14 May 2025 13:33:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747254805; x=1747859605;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dRKzmwRDtNONnFtD+GVYYT/F68o9yjtA9WFV64BwRvQ=;
 b=CEt/U3waTb/clkjY2Y6jaI+d70SAKXz/SvaPgld3+hB6d3QIHYGayIxXKHXUXW7qGk
 /M8smOjtpSAsEiy35dvZl/rmZ/+GWCImiGON0jsxnYOmWa5AScCdKUMUWlLlWKAz2t/c
 Xqv7cgWaYV2MxnYmrZ0AJRWzhfoKRI4jh1/IVs929LxpY+1XTswCCiTyknMXf0/V19pA
 CtbYCfqcmr4AsPnNfcCvocYeYkGq+t18jlpYmdIyLaYz3+ncaPkgDrNDNWTNXHRXS0bM
 7mSrlGsHJ7VCVUKEemxJNA7d3b95UoD/zrpv3FixmaaFn+cwkZ87nLIPmWWQj6ePTGqG
 Zxzg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXId1Vleb5ylIl2r2bCyH3ZbALE95Kg8LwFo5kyT+ovh8uvcKI8mqeQ75i5TKJxDFDvKYszjBcE6+A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw8N2C0MlLwla2j8zJoLJ6NDdeUhSIUL+YhUJg7MSE7J81jh1xS
 D7SyzTQQtJbzjEYDNGFCxkVjeuN5M0+HMtNqmYpmvKSTViYV//6Mscx/7AZMb1idk9SouyanDyb
 2ROH4kZ33OWnk8ipeIZ164Vc0Ivc35jA5GA+Rh/yeCTTvbxbo/lqqB8RxiS1jE9lFCcQ=
X-Gm-Gg: ASbGncuNBhCTs5I0trORCpPa1vhMkLHQEm1uckCSDdyPyW1nzvhIsUHSgH1zjPGCANn
 PmewaUONswjOlBEwSfAp2rzF36SY4cqCceA7Ckoa/GhMrcRija3eMmoEUk79oJKnDoGJQEA7kwm
 5Z4sd3v75VVSuc6o30nOYQ8cQ4xe2z+N4lLC5JRwb1G/n9nCjsHO8xFD2wZlXpzsrMTdKWTj+zJ
 pmTc93F4N90Q2UlgPjYBNofuwBiRs5BjMBXg2cp5/+KK4sIe87/G37FHP88BohauuxzYHuyo0u4
 z+Nu8c1ToIXPnb45MKxTBhQyOfYKFNVsjgoDrj/3r1lu6F1pkff0GL06FY24bP/8O/T3hSeWBR0
 =
X-Received: by 2002:a05:620a:17a1:b0:7c5:5d13:f186 with SMTP id
 af79cd13be357-7cd287f8e7cmr618136185a.10.1747254804686; 
 Wed, 14 May 2025 13:33:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFsUrt5xuy6IhXhWS73X4G6t/mH1OxTdsbAV8OsEnGFxtr3ke2Igx0BWrmUw4ortNrnKDd8Gg==
X-Received: by 2002:a05:620a:17a1:b0:7c5:5d13:f186 with SMTP id
 af79cd13be357-7cd287f8e7cmr618132885a.10.1747254804305; 
 Wed, 14 May 2025 13:33:24 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54fc64b6e08sm2379780e87.120.2025.05.14.13.33.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 May 2025 13:33:23 -0700 (PDT)
Date: Wed, 14 May 2025 23:33:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH RFT v2 14/15] soc: qcom: ubwc: Add #defines for UBWC
 swizzle bits
Message-ID: <rxoefvyob7enrbtdpmsevw5wzatk4dwa5jomscqpxim5sjmymd@dblxslxy7q5v>
References: <20250514-topic-ubwc_central-v2-0-09ecbc0a05ce@oss.qualcomm.com>
 <20250514-topic-ubwc_central-v2-14-09ecbc0a05ce@oss.qualcomm.com>
 <c3txdoumutgk4exshhyi53ef4xziu5bbe3ib67hw4gsvulh4yt@522qphwu3ocx>
 <c8517af1-5fb9-4350-814a-85ce26e5e334@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c8517af1-5fb9-4350-814a-85ce26e5e334@oss.qualcomm.com>
X-Proofpoint-GUID: tWTNbVXTwa6oUigzAFyuwDDjVHFqztlp
X-Proofpoint-ORIG-GUID: tWTNbVXTwa6oUigzAFyuwDDjVHFqztlp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDE4OSBTYWx0ZWRfXxzljxcW/MkBR
 pSV84w88pdmAp0k2VxbkAZEKGmmEaVSwla+zrXqESpW11E178l05UmgMaVdReG71zaFTx7sla4T
 OKVYyjJuVXnK62fYW/k9C7I8BqK4hKTg0e6VGaGHi6y++WFkg7bGrReqUbhcqsrI0Kw2V79PpT/
 p4/H4ZnjgRRrdPCFG6XDCKhDJrZXHe9GinnHh6Aui2mBTIxSIfKqn2NvfMbp4Z8C8JI+jWQr/zT
 R7Xnv7kKU8HQIy9IrzsJQYmXQMdh6PGrQS0HIsSl1u4K6p158bSvtjcumn8sRJUleeRsWZgvzc4
 8wDNLHD7/7gEp9NU2RYrQb8xvbD301FzfmlbfkC4XGJeccmkS8qrCSBNsxbtV6S9G77nxc8pYqo
 UWIq7FLdh5OutAp88+wRtylhijg8BDfX0quAJz8F0ILRQQZpfDQvoRvtMJJmuxsp69JM9G9V
X-Authority-Analysis: v=2.4 cv=LOFmQIW9 c=1 sm=1 tr=0 ts=6824fe15 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=V6yTId3DeqrxdCHudOoA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_04,2025-05-14_03,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 mlxscore=0 malwarescore=0 mlxlogscore=748 impostorscore=0 bulkscore=0
 clxscore=1015 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505140189
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

On Wed, May 14, 2025 at 10:09:35PM +0200, Konrad Dybcio wrote:
> On 5/14/25 9:24 PM, Dmitry Baryshkov wrote:
> > On Wed, May 14, 2025 at 05:10:34PM +0200, Konrad Dybcio wrote:
> >> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >>
> >> Make the values a bit more meaningful.
> > 
> > Not sure if it's more meaningful or not. In the end, we all can read hex
> > masks.
> 
> 0x1d7efc35
> 
> magic constants are no bueno

Ack. Then please drop UBWC_SWIZZLE_ENABLE_ALL and list all 1-3.

> 
> Konrad

-- 
With best wishes
Dmitry
