Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0ABCC219F3
	for <lists+freedreno@lfdr.de>; Thu, 30 Oct 2025 19:01:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 814C410E31D;
	Thu, 30 Oct 2025 18:01:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="m6mN25O1";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WUO+QVJi";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1499110E0ED
 for <freedreno@lists.freedesktop.org>; Thu, 30 Oct 2025 18:01:17 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59UB8aYs3808761
 for <freedreno@lists.freedesktop.org>; Thu, 30 Oct 2025 18:01:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=cXV5bK5NXAnWN8bRl9mITOxX
 zPOm4995onAokhRKwyM=; b=m6mN25O19Y4bcqLCtKcVEF0B/y1gxRwia7ULE0fq
 qYPXfgHrA1nctu1RYAFFx5yrQNs1wM304UEcfyB0cZLP7H1HBTTBecQ+afqCWy0F
 CQPWRKpivCGuX5490S5PjipEM8H0yzqLUns/rYD0f7igFBfUecFUlq/7VbE3cgr9
 VvTC82IB7llKV6mX+EyUnXbBeMajf9O9sc8MzYq7O8ok7IL+OXOAVyZtbqOE6LO1
 cu3ybhDOR8s2uacfCdPvKSB1OKP2E+q1gYKmNt7EOvTFwjwwSv5yM/0PB/e4NHRR
 6ziRF0kQ3Ebah6qHgtIv3ap2ryn8BrZDSLVP0q9lqUqpYw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a46vv95x7-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 30 Oct 2025 18:01:16 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4ecf5d3b758so24587431cf.1
 for <freedreno@lists.freedesktop.org>; Thu, 30 Oct 2025 11:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1761847275; x=1762452075;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=cXV5bK5NXAnWN8bRl9mITOxXzPOm4995onAokhRKwyM=;
 b=WUO+QVJireIWJBYjPIhtjzaVPpZpQhse3TtbsMvzm242s2Gjos4ESThNvQy1zFNi9o
 VvTfFqpCTFrRB5yH3lSImFuUiTwcGTCy4QcHF/0iRnLCS/QWwaldReVA6UYTBG+S/xoE
 RKVagrdyK1M+56J7KLdiDOhicFQCfSU9uXXv/LgfnN3F9eNhlBUBxfEaX2KcT1Z9iaZq
 c58rV7ftx5is4l/T9BQAejmtLV7xF/c9AALF8Sj3DHlQRKXa1KWJP1CJ7BAhM7ByWmaT
 X26+rxU6WAkRJUzFGR6PnGgoP0AopBMNAPglCGIOEMwXeerwZhx66YM2iAyU1LHDjVWK
 vKiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761847275; x=1762452075;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cXV5bK5NXAnWN8bRl9mITOxXzPOm4995onAokhRKwyM=;
 b=TKOZJ43brmO04wUrkQVAtGW/Xods2grDhCZzfpE1WAS8RJ7YQl8ypIOegFn2hC75zo
 IZUJ0V49SV6z6Ebc+fE3LkvnQ0NqjAaYrVshaf+83bwVnK6EtrsJZcXyACZc//UzqYTO
 6gsq2M7hmr91YPo/QXc+vynHpJGJ/6D/LuYaLMVE2JZxCeja/rBwebZzCVP4/72DO5ct
 LRbAuZXWMGhrtjM+EewDmsqmdiNvEJfAACSjR56G95LLMt/PO8htSzAUt5sUDVgxRFbk
 TNsYqtc3ukwVnJyot51lHXX6dHLoSkhXM2/bpCb70jp+vhbh8SWnTi4Gwb+tg7PHfgwx
 jNhA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWMbkfiCLtsIM1FlEC9aYSdlQXLopiz/TRSWQQFw2aGbXvIdDX1e3h2l77MkPmyeuaSnD/Ktq1FZSI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxnHN9BYXWeQjbcGHzflXLqnSetl8lI4csdliclQ14dZUNC1ldT
 140QkU6KkdTEHrnfd+cUuIvHVG/yGiPQ8BPhE7WT4JemF0JwBXsDtXGLXAG4kNYKSMeru3GdAR3
 9+Xw6WnTyu8DVdqLdBMnur0rSuK/WOPddqXYelW3ni13hVmi6+kZHzwDdoPUVWK3xsjw6PA0=
X-Gm-Gg: ASbGncvPrN5hzJVj00Mdh5LCx3vzkS8bdn1N3qiBLLszb6hmZs1KB2bnNunwr3fiLxf
 vt0HasHu+1yll7rfjnHs/qeBp13/KHUksg6nR3SGGayqCzkDb45Br+eLESeRUsW6mG1Y/3yDR3z
 nCHfq5tfxZ0eqhuP09QfhpTwpCc74BWzUPehLo24Hh0y1lZ/1B2vi92Gaw8K8edbqO0fjZ93HqA
 HzS49TwSnf6iLEMnXY1BZTleSiWKxudBzaQEvc6fFXNuPtfkMs4n5AaZhLOAAGwSvNosAp3JEy2
 /BN57rSjFJmOEcm1zMCzaxDV0P95B5cUrX3dSK/uNRN3S0N1HaVaa7LQHAjNkRgTS+mirSbR+DU
 i8SbAwu+sqCbjPrun4XHw1lwPgsyBj/ROCdZVcJxhbWdxhlaOPTT0D9wudBxZhphyML1w6R/r4n
 XYAZkHyXkD+NdC
X-Received: by 2002:a05:622a:40f:b0:4e8:a269:ceab with SMTP id
 d75a77b69052e-4ed30d4ecfamr6635411cf.5.1761847275156; 
 Thu, 30 Oct 2025 11:01:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGBsOQjcOvRjMP4pTZJOPkX1Iw2AZufQNpkNP01OrVkZ+/BT71YfbXhtRUq9boF7rgtxSZZrQ==
X-Received: by 2002:a05:622a:40f:b0:4e8:a269:ceab with SMTP id
 d75a77b69052e-4ed30d4ecfamr6634351cf.5.1761847274420; 
 Thu, 30 Oct 2025 11:01:14 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-37a1614e1edsm3259121fa.22.2025.10.30.11.01.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Oct 2025 11:01:13 -0700 (PDT)
Date: Thu, 30 Oct 2025 20:01:10 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: yuanjiey <yuanjie.yang@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 robin.clark@oss.qualcomm.com, lumag@kernel.org,
 abhinav.kumar@linux.dev, sean@poorly.run,
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
Message-ID: <mlhohop2uifsdo3qxxzmuxbkjo735hdw6xcosvkmsx4eskfufz@5otklefey5k7>
References: <20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com>
 <20251023075401.1148-2-yuanjie.yang@oss.qualcomm.com>
 <omlhiywjr46ik6bj2aiutgcf4aifen4vsvtlut7b44ayu4g4vl@zn4u3zkf6cqx>
 <ad906eb5-c08f-4b66-9e37-aaba99889ad4@oss.qualcomm.com>
 <aPryORKIuSwtXpon@yuanjiey.ap.qualcomm.com>
 <einog245dsbqtx3by2cojyzmyctk2fffpwndwoe24puwqq4fta@cu6iiidxqgr4>
 <0291d0f2-483f-48d8-8c75-f1bbcd1ab18f@oss.qualcomm.com>
 <ehgdx7av3jewowkvtsqrbnsphgxm5hryl6n5otnapi4xneldze@gcwvpssisv2x>
 <aQGHyN19/a/tl0BH@yuanjiey.ap.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aQGHyN19/a/tl0BH@yuanjiey.ap.qualcomm.com>
X-Proofpoint-GUID: LkdX3ef3gnbb0LfjiAiuDmqO2vbi68Wh
X-Authority-Analysis: v=2.4 cv=dK6rWeZb c=1 sm=1 tr=0 ts=6903a7ec cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=dW72lhU0GKDYo0j8srIA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: LkdX3ef3gnbb0LfjiAiuDmqO2vbi68Wh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDE0OCBTYWx0ZWRfX667UriIogGp3
 8nT4a5onw++Vg6q0A+sNeMs7ZNp5X3yDw6DEiRTYq1AuBMgtXFtN9B5FZQ25Y3wUaIDpGJ9IYfe
 dOaxSMc/o1q/09zwojNlpcmtztoxSwKeY6QxfNmNHwWadjtrsDr6YCwhLySM1w0BtWbjwchm3oS
 ZZ1pssVjnScFMFMXplAbRnzcIXOb1GV+OT9d0m6jaTsaE8iQxzakpXudMFwkF/fEF5ZQM/91BGL
 yC//P2VCqfY2ALNSo+YrCiFbGIaVW0y2UkwKANfcjpHvZ03mWhdzgtbgT26hF45HFDcv+rLF7JZ
 1no/KG1evkdMhxlARimHUE0vQsmTBH84IbpvyGklxsFXrBxZVK3XWgO5jrGRfIHizAg34AkAjUO
 K8FQasP08fUF9hgBwVO++4dOjFWONg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_06,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510300148
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

On Wed, Oct 29, 2025 at 11:19:36AM +0800, yuanjiey wrote:
> On Mon, Oct 27, 2025 at 03:29:40PM +0200, Dmitry Baryshkov wrote:
> > On Mon, Oct 27, 2025 at 02:20:26PM +0100, Konrad Dybcio wrote:
> > > On 10/27/25 2:14 PM, Dmitry Baryshkov wrote:
> > > > On Fri, Oct 24, 2025 at 11:27:53AM +0800, yuanjiey wrote:
> > > >> On Thu, Oct 23, 2025 at 02:02:45PM +0200, Konrad Dybcio wrote:
> > > >>> On 10/23/25 1:48 PM, Dmitry Baryshkov wrote:
> > > >>>> On Thu, Oct 23, 2025 at 03:53:50PM +0800, yuanjie yang wrote:
> > > >>>>> From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > > >>>>>
> > > >>>>> Add DSI PHY support for the Kaanapali platform.
> > > >>>>>
> > > >>>>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > > >>>>> Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > > >>>>> ---
> > > >>>
> > > >>> [...]
> > > >>>
> > > >>>>> +	.io_start = { 0x9ac1000, 0xae97000 },
> > > >>>>
> > > >>>> These two addresses are very strange. Would you care to explain? Other
> > > >>>> than that there is no difference from SM8750 entry.
> > > >>>
> > > >>> They're correct.
> > > >>> Although they correspond to DSI_0 and DSI_2..
> > > >>>
> > > >>> Yuanjie, none of the DSI patches mention that v2.10.0 is packed with
> > > >>> new features. Please provide some more context and how that impacts
> > > >>> the hw description.
> > > >>
> > > >> Thanks for your reminder.
> > > >>
> > > >> Correct here:
> > > >> io_start = { 0x9ac1000, 0x9ac4000 }  DSI_Phy0 DSI_phy1
> > > >>
> > > >> And v2.10.0 no clearly meaningful changes compared to v2.9.0.
> > > >> just some register address change.
> > > > 
> > > > Addition of DSI2 is a meaningful change, which needs to be handled both
> > > > in the core and in the DSI / DSI PHY drivers.
> > > 
> > > DSI2 was introduced in 8750 already, but it was done without any
> > > fanfare..
> > > 
> > > I see a diagram that shows an XBAR with inputs from DSI0 and DSI2,
> > > and an output to DSI0_PHY (same thing on kaanapali - meaning this
> > > patch is potentially wrong and should ref DSI1_PHY instead?)
> > 
> Yes, I check ipcata Doc, I see DSI0\DSI0_PHY DSI1\DSI1_PHY DSI2\DSI2_PHY in Kaanapali, 
> addition of DSI2\DSI2_PHY compared to SM8650.
> 
> look like I should add: config io_start = {DSI0_PHY, DSI1_PHY, DSI2_PHY},

I see DSI0, DSI1, DSI2, but DSI0_PHY and DSI1_PHY.

-- 
With best wishes
Dmitry
