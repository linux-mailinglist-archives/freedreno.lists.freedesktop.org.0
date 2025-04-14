Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D279A88056
	for <lists+freedreno@lfdr.de>; Mon, 14 Apr 2025 14:28:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5005810E125;
	Mon, 14 Apr 2025 12:28:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Yd+9BpfE";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 544D310E125
 for <freedreno@lists.freedesktop.org>; Mon, 14 Apr 2025 12:28:44 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53E9A25c029983
 for <freedreno@lists.freedesktop.org>; Mon, 14 Apr 2025 12:28:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=pcD1hnXGwP4oWvtyhTXiHED+
 7VwXoSi69a6mb6yqA1g=; b=Yd+9BpfEuiDZ4o/Ei13vwKatWPUgywArkggTGnCI
 aUqEK9J9iWqvBpLlxSiHIiQQq5PJg/vPsNHry2jB3eKMYj/wSY2m16gPSoy6SrAn
 hNPTp5iVvDB9KiH4NXikB+J1aiQk9I7pOHGl2jCV12mTCbyDnL1rr41hr1+9h3wV
 RUNUCh1oBMbfacU+FgGhTNHxEs22+Uql/ZBoqUJLm5/Kr48jRxmNQe2uG14YoYFB
 4DL8er5NgTCnE8LEpuHwQBBArM49t9h30D13KxV509+j7X7Pw5FjpTKg/t0GRPUt
 NlSf8BfEFiNA3jePsKh4MUpwx3yn1v7r2WCvwJUE01XksA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yfs14jnr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 14 Apr 2025 12:28:43 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7c791987cf6so870091385a.0
 for <freedreno@lists.freedesktop.org>; Mon, 14 Apr 2025 05:28:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744633722; x=1745238522;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pcD1hnXGwP4oWvtyhTXiHED+7VwXoSi69a6mb6yqA1g=;
 b=gHNbGqV896+ZEuK1z/k7F2z7kofyV4K6uIerj03uOORaC/JwNjTKLjbcTEBKCOob3j
 coFgQQePv4Da3U9swGPatPjoaVJsThMY3qAccdA9xcL+Jnsa4oA2mrUMQIUtPWEZzZFL
 mYQWaxNnsYXlRcC5do5l0+maS32ypXJodbAa734J3Uc8rxoPKG0umWPnzTvnbWoQfGxQ
 uOx3nXni7BPPjWJ/eGKxsyXnT936r9Ha3Fb05pE6tPDGvDmAiYbQMmfV2sMUHRbuzF1P
 OinCDIDT8RUwYDvWFLrbaQSO6UEN2gPf2wRm9b3H9RrwzCPtsQWy9HkuIFucNqfhdtFO
 5l/g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUIqVlI7d8yFGO11nsx3HzlxAnv/DhZTUdOAq51n//zcOIS7NmoFezf/VVf6o0V49aT7I/XcwOoYzE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyRr0EUW03YNH2U7CnaqBYdIDOK+x8ckKcYbhOils1S5T3xTt+6
 w/lMAONxJ8F+ziLwTBGTqWLJsHzoyA8JhW2k5/UO/zHzeYOUTjsP0pJJPihA5gfoLBlVUa1+HvM
 GaM8jeCKT5/JcLrZNkq+K135kIXp34ELomN7f/OAxdYEbtmIcl12D+b0NP/U39VR0S8Q=
X-Gm-Gg: ASbGnctM/5oQGLAxCGl3BQAFE1rnZThpxFrF3xBlixka5i26gWl7nJWBftP26YbdoML
 ezEVV7teTs7pHEqEPaFO5yC8/iyFfBqQRvteBY6ncnDd2D2fBkQ5SHVxlIJJkr1DpeV1PzAF5Rh
 aV7FON4SQtCgpFpW9F3Vy27xpeJHOfPIj6o72m60PqOQ/exbNlKsS3CRmU0Ik9cZ/Rpr4IaZNyI
 t/DZmYGNmMCaZC0Oi/m5Hn9Q8gY8jjPG7GJWb7XgKOkvya//mds4ooml7LhqA/5QGtBTO4RXjB6
 s/ALU8Dm+KZ3khWwyWfjza0nkzwdqZd9VUIx9uF0as5MLCbSxndsYfhuLDMJs4Y3u2fnx9uxC08
 =
X-Received: by 2002:a05:620a:178d:b0:7c5:3c62:804c with SMTP id
 af79cd13be357-7c7af10c99cmr1793639985a.21.1744633722131; 
 Mon, 14 Apr 2025 05:28:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFsetSET612d6fMhQCBXpRJnTz65qWucBdrgE0bNMyx8ZlJtaAzw/28Nhs4mXaotD4AP0m9Gg==
X-Received: by 2002:a05:620a:178d:b0:7c5:3c62:804c with SMTP id
 af79cd13be357-7c7af10c99cmr1793633485a.21.1744633721593; 
 Mon, 14 Apr 2025 05:28:41 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54d3d238b8bsm1084415e87.88.2025.04.14.05.28.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Apr 2025 05:28:40 -0700 (PDT)
Date: Mon, 14 Apr 2025 15:28:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Subject: Re: [PATCH 0/4] Retrieve information about DDR from SMEM
Message-ID: <qdip4rtk2zusxkdlui4ujnybsh7jfqk25tazx477tueytp6cbm@dom2fduk2r6z>
References: <20250409-topic-smem_dramc-v1-0-94d505cd5593@oss.qualcomm.com>
 <685e784c-3f36-4cd1-9c34-7f98c64d50f2@oss.qualcomm.com>
 <0bec3e62-0753-4c3d-abe1-1a43356afc80@oss.qualcomm.com>
 <e7bd2840-dd93-40dd-a1bc-4cd606a34b44@oss.qualcomm.com>
 <CAO9ioeUeNeSxz7ADZ-BbJbhEKkszVS+SmbqaZCgTpL=csak=hg@mail.gmail.com>
 <b04464b6-2ad9-4866-88e9-437e96645726@oss.qualcomm.com>
 <sgjporlde6bgcp2mhr3r5c6wj3a3u37s5nlrrokbutsyizixod@7shpt55muqki>
 <4e265348-3466-49fb-82e2-255205052d1e@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4e265348-3466-49fb-82e2-255205052d1e@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=P9I6hjAu c=1 sm=1 tr=0 ts=67fcff7b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=MwWKvEgEnNFHFowGc98A:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: glYN5e36Q9hRqZXqg-w9_RCfROPkYofF
X-Proofpoint-ORIG-GUID: glYN5e36Q9hRqZXqg-w9_RCfROPkYofF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_04,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0
 mlxscore=0 spamscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 mlxlogscore=498 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504140091
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

On Fri, Apr 11, 2025 at 12:52:32PM +0200, Konrad Dybcio wrote:
> On 4/11/25 12:50 PM, Dmitry Baryshkov wrote:
> > On Fri, Apr 11, 2025 at 12:03:03PM +0200, Konrad Dybcio wrote:
> >> On 4/11/25 11:57 AM, Dmitry Baryshkov wrote:
> >>> On Fri, 11 Apr 2025 at 12:49, Konrad Dybcio
> >>> <konrad.dybcio@oss.qualcomm.com> wrote:
> >>>>
> >>>> On 4/9/25 5:49 PM, Konrad Dybcio wrote:
> >>>>> On 4/9/25 5:44 PM, Dmitry Baryshkov wrote:
> >>>>>> On 09/04/2025 17:47, Konrad Dybcio wrote:
> >>>>>>> SMEM allows the OS to retrieve information about the DDR memory.
> >>>>>>> Among that information, is a semi-magic value called 'HBB', or Highest
> >>>>>>> Bank address Bit, which multimedia drivers (for hardware like Adreno
> >>>>>>> and MDSS) must retrieve in order to program the IP blocks correctly.
> >>>>>>>
> >>>>>>> This series introduces an API to retrieve that value, uses it in the
> >>>>>>> aforementioned programming sequences and exposes available DDR
> >>>>>>> frequencies in debugfs (to e.g. pass to aoss_qmp debugfs). More
> >>>>>>> information can be exposed in the future, as needed.
> >>>>>>
> >>>>>> I know that for some platforms HBB differs between GPU and DPU (as it's being programmed currently). Is there a way to check, which values are we going to program:
> >>>>>>
> >>>>>> - SM6115, SM6350, SM6375 (13 vs 14)
> >>>>
> >>>> SM6350 has INFO_V3
> >>>> SM6375 has INFO_V3_WITH_14_FREQS
> >>>
> >>> I'm not completely sure what you mean here. I pointed out that these
> >>> platforms disagreed upon the HBB value between the DPU/msm_mdss.c and
> >>> a6xx_gpu.c.
> >>> In some cases (a610/SM6115 and a619/SM6350) that was intentional to
> >>> fix screen corruption issues. I don't remember if it was the case for
> >>> QCM2290 or not.
> >>
> >> As I said below, I couldn't get a good answer yet, as the magic value
> >> is not provided explicitly and I'll hopefully be able to derive it from
> >> the available data
> > 
> > I see...
> > Is this data even supposed to be poked into? The foo_WITH_bar types
> > doesn't sound like a very stable API.
> 
> Yeah, it was designed with both the producer and consumer being part
> of a single codebase, always having the data structures in sync..

I feel somewhat worried about parsing those structures then. But... the
only viable alternative is to have an in-kernel list of possible
platform configurations and parse the /memory@foo/ddr_device_type
property.

-- 
With best wishes
Dmitry
