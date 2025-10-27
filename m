Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5C5DC0E080
	for <lists+freedreno@lfdr.de>; Mon, 27 Oct 2025 14:29:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6081110E49A;
	Mon, 27 Oct 2025 13:29:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="oZGbVqtd";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD7C810E49A
 for <freedreno@lists.freedesktop.org>; Mon, 27 Oct 2025 13:29:46 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59RCTusj2752247
 for <freedreno@lists.freedesktop.org>; Mon, 27 Oct 2025 13:29:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=VV74qFJFxgTw/EeIwCONHKOh
 1+oiVvn9rVjApUsNyoA=; b=oZGbVqtdCtjLIsgOy8MmyvH+myvMqL/Ou0HfCbxZ
 z4zhPDUqsto6nrU3BGjpphoTxrCI18x0pnvm36fBy1YS4ikSb0ow/gKB5xZVxjLn
 dj8i1Nd1GwZUHESoTfzqFtZumXtALQNddY8ZR9QRAlrTPNl4EztPfJV+iqv+GNVk
 exvhoMz3laqurEH0MIsIEtgKOoZZ0DuDMbzd+FSEen7gBWNsU/lUolio1pxZPCaC
 9Q29kZpqoIVYp9ZBjcqXdbpSPRLj1UfQhqORAM+MBejOusZ97n6CrJWqihT74x2h
 RWd5xuazULbzz3I3J8690qWzQz5HaX3NeuBNOD+/lRI5rg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a28swg5jy-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 27 Oct 2025 13:29:45 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4ecfa212e61so31491401cf.1
 for <freedreno@lists.freedesktop.org>; Mon, 27 Oct 2025 06:29:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761571785; x=1762176585;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VV74qFJFxgTw/EeIwCONHKOh1+oiVvn9rVjApUsNyoA=;
 b=fstLxseg5f+WuJlRzxKFTErdFf5xHtelZoK+M/UmjEZYop9ySJlWiNxqQ83RELhqNs
 hpFWSOOgf0ll+oE6Oj157W8Wjt3KPYS2/c4rO4Hp7qyoe4Js12kUor5abi2CD946DrHZ
 hTiQo+9rA6YDHNUgrpVeMcKy7AHv2OvHvuPD9Bxwd4pjxOZlwdryZ0wnto5z1Vcn092P
 nsPNXGSi5tokHacr6DQK6hkkI+5ur2WcnGYBck4Imhd0UvPf0PgP97KgNUUP+4PX+9Tn
 FnFh8l/nG+DDUaMieGYcBWxViHQpWIkBusN71nUrOMWLU1l4U9qvAOTguveYTqcZmfIO
 0Lzg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW+ZzGMmUF9FSChXXYCyNxEzTW2NZAekr7PgWfOKPbw0NyKGxqwMVszQ8b6LIH8ejt9Pe4GPuOWo8Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzJ1ZhSI8Ajbb3qCWrqOTMvrpzqyPNd4Jcz9Dolp0UXelpepIeP
 3BUGI0k7Cisbm/r+fIix5t4UN5ajLZNe334p9pkKmOXiHWEgkk9Av4ds5E8udCkm1Dl5CkRi+1C
 KP86vlMjjOv+WRzhOYhWuZbQVOv0gcPrI7gtcVIhlLttQvQlCJs26Iwv/u7KHzYNBdYZs75c=
X-Gm-Gg: ASbGnctkxC9tGTwJK4kiX/FB77zJ2fyTAMNXV+Z0aKyR2T0I0CJRuNEqqINOAEowVPk
 bNYAD60MdWZwxGkXTLrPnSuhi2kt6fs6qCewxlJAm36J0tlRkxUsYp8WPrrp4rLmcEtSZLJ5r6M
 ibTTJK210Du4UOKtRAkc/IOMXWnIZVGLcPAy9WKVN2kjc9JpV+qPSSt1E44GJUR0EHRDOg8XxCv
 kQP+WI7S3vqch+cgjweSYAPW1yUXl2itslDuCSQHrb0SJ/WnJjqf4lWu5MvTgPzxzUPd9bZs9ku
 2jHySd4dUyn+ULeVm048k76V60iiPPD5oydf3QrSghMhOCIxvpC1b2Pg9YjzTMJNMcmPiAZ57Nq
 Wsjv0u0iY5/HLrb/DT7UEEv31kmotUTcjvmm1CqVP8SlrLVSY2DYNv9aidhD/tr+mLWY+I9evuS
 m3vY/sZNlGwipi
X-Received: by 2002:a05:622a:1190:b0:4ec:ef49:1b19 with SMTP id
 d75a77b69052e-4ecef492b41mr65596181cf.5.1761571784932; 
 Mon, 27 Oct 2025 06:29:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG2ciuf1XZlemNcLVcB4yTtYI2v5x4NM+7pH7d4hnFEsjbYGGggzRsDo1URSo4Ky4GlyXwgvw==
X-Received: by 2002:a05:622a:1190:b0:4ec:ef49:1b19 with SMTP id
 d75a77b69052e-4ecef492b41mr65594691cf.5.1761571782964; 
 Mon, 27 Oct 2025 06:29:42 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59301f74ba6sm2304297e87.90.2025.10.27.06.29.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Oct 2025 06:29:42 -0700 (PDT)
Date: Mon, 27 Oct 2025 15:29:40 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: yuanjiey <yuanjie.yang@oss.qualcomm.com>, robin.clark@oss.qualcomm.com,
 lumag@kernel.org, abhinav.kumar@linux.dev, sean@poorly.run,
 marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, quic_mkrishn@quicinc.com, jonathan@marek.ca,
 quic_khsieh@quicinc.com, neil.armstrong@linaro.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
 aiqun.yu@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com
Subject: Re: [PATCH 01/12] drm/msm/dsi/phy: Add support for Kaanapali
Message-ID: <ehgdx7av3jewowkvtsqrbnsphgxm5hryl6n5otnapi4xneldze@gcwvpssisv2x>
References: <20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com>
 <20251023075401.1148-2-yuanjie.yang@oss.qualcomm.com>
 <omlhiywjr46ik6bj2aiutgcf4aifen4vsvtlut7b44ayu4g4vl@zn4u3zkf6cqx>
 <ad906eb5-c08f-4b66-9e37-aaba99889ad4@oss.qualcomm.com>
 <aPryORKIuSwtXpon@yuanjiey.ap.qualcomm.com>
 <einog245dsbqtx3by2cojyzmyctk2fffpwndwoe24puwqq4fta@cu6iiidxqgr4>
 <0291d0f2-483f-48d8-8c75-f1bbcd1ab18f@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0291d0f2-483f-48d8-8c75-f1bbcd1ab18f@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: tb7r0gLBHYE3pfY8YAxwEeWwLpMoR5q1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI3MDEyNSBTYWx0ZWRfXy1gFZi+7yx0h
 qMrdRc1vo5hd8XLcoxQ5W0pfexAV+cqc8Js9cYMb8VcnoZrJ1nGa/SVKe2hl/kh9X7otReHMUME
 ILMsq4XBJbH7PUH9pqEsOqWm8HAcJ8d916XOQmpw6R3Hu2R90szrgNBPehLlhR771bPxoTgZTCQ
 P0ktsoWrfKy/an4Ay1nsxLFWQ4G9KAep2umoL/unzpByGSaAWuAzan+LJ6Rsx3HMPbxcRJfuNqU
 T6NJvWW33YuTx6oT+Snv51EtxQQ2aYAVc/Det2qpVRZNFKDXgP24YoEAKqf7b68tMuOyD3DZlnq
 8b5K/C/a6CkrcxeAkKPwpHPSQrdHBNSRoJPNOuaWl00YrPoXInb+puM4V1/UakvzXXUfA/nBFqm
 OOXRVekjiyw23Pa/VTduuJ5O6WaHYA==
X-Proofpoint-GUID: tb7r0gLBHYE3pfY8YAxwEeWwLpMoR5q1
X-Authority-Analysis: v=2.4 cv=fL40HJae c=1 sm=1 tr=0 ts=68ff73c9 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=r5vzRnyTyaal3BpozBMA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-27_05,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 phishscore=0 suspectscore=0 priorityscore=1501
 clxscore=1015 adultscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510270125
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

On Mon, Oct 27, 2025 at 02:20:26PM +0100, Konrad Dybcio wrote:
> On 10/27/25 2:14 PM, Dmitry Baryshkov wrote:
> > On Fri, Oct 24, 2025 at 11:27:53AM +0800, yuanjiey wrote:
> >> On Thu, Oct 23, 2025 at 02:02:45PM +0200, Konrad Dybcio wrote:
> >>> On 10/23/25 1:48 PM, Dmitry Baryshkov wrote:
> >>>> On Thu, Oct 23, 2025 at 03:53:50PM +0800, yuanjie yang wrote:
> >>>>> From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> >>>>>
> >>>>> Add DSI PHY support for the Kaanapali platform.
> >>>>>
> >>>>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> >>>>> Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> >>>>> ---
> >>>
> >>> [...]
> >>>
> >>>>> +	.io_start = { 0x9ac1000, 0xae97000 },
> >>>>
> >>>> These two addresses are very strange. Would you care to explain? Other
> >>>> than that there is no difference from SM8750 entry.
> >>>
> >>> They're correct.
> >>> Although they correspond to DSI_0 and DSI_2..
> >>>
> >>> Yuanjie, none of the DSI patches mention that v2.10.0 is packed with
> >>> new features. Please provide some more context and how that impacts
> >>> the hw description.
> >>
> >> Thanks for your reminder.
> >>
> >> Correct here:
> >> io_start = { 0x9ac1000, 0x9ac4000 }  DSI_Phy0 DSI_phy1
> >>
> >> And v2.10.0 no clearly meaningful changes compared to v2.9.0.
> >> just some register address change.
> > 
> > Addition of DSI2 is a meaningful change, which needs to be handled both
> > in the core and in the DSI / DSI PHY drivers.
> 
> DSI2 was introduced in 8750 already, but it was done without any
> fanfare..
> 
> I see a diagram that shows an XBAR with inputs from DSI0 and DSI2,
> and an output to DSI0_PHY (same thing on kaanapali - meaning this
> patch is potentially wrong and should ref DSI1_PHY instead?)

Most likely.

-- 
With best wishes
Dmitry
