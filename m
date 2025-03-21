Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E53E4A6C1AA
	for <lists+freedreno@lfdr.de>; Fri, 21 Mar 2025 18:37:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D07D10E7FD;
	Fri, 21 Mar 2025 17:37:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vp4vO6c7";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 010CE10E7FD
 for <freedreno@lists.freedesktop.org>; Fri, 21 Mar 2025 17:37:38 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52LAThql032660
 for <freedreno@lists.freedesktop.org>; Fri, 21 Mar 2025 17:37:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=5EPzIyilGqOZI5ta3x+QlI0t
 ANS6zHW/9qVjSLgS1/A=; b=Vp4vO6c73kU5bmNKyEmP09Krk5Pv61VWGOqeDNFb
 LmYIks7+mB2u+gNWcH1kBFBVPXA0Fl1JXqsM2ObXX3DLjh0BllYGJMr8TsD+IL8V
 RWHGJlARaIlCdwP1BicyOWvsLRnbpcFuginyUV1V+GYSr6K9AdpuqHqcu9+IjGsq
 9ZcNOFiG9L2lbdrojt0CH7ldJtdiIKRPn/98WNA6k3+KZffaQId3OgzEyky5ELnO
 uSjqdWQfC+IEgUNK1tQZCBLpz5VLzAPw4IOWQLs3+qne7KJH5h/IeDI1G4AxCRJ/
 M9e2oMooTPTRR0holz5WdSOormxc3Y2PZ35WNrHVLyzwig==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45gt5kjwq6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 21 Mar 2025 17:37:38 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-6e8f9057432so42384596d6.1
 for <freedreno@lists.freedesktop.org>; Fri, 21 Mar 2025 10:37:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742578657; x=1743183457;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5EPzIyilGqOZI5ta3x+QlI0tANS6zHW/9qVjSLgS1/A=;
 b=PpWvclZqqX7GE9WC8svvVKhRwGAAlrRPKZm44vYUVmKQXyn01EzBndPpAfcnVUQKQ7
 Uzc474uZJcKCn8OuHA3G0kaPWJ025VBzKqpcveNpENUQUlS/czlDEvMt6iXzIMN8pHji
 xlktmW28PjPwWL2XZAkboR17mGZTfDIU1UU+4GW73sGajdNvNGtbikjACcF1GmkGGYLg
 G0MZ23sLcoZp9q3793MpUQkKejhNM2lDUyD60Pz8MZoW7uBUIt7ohjJGJcrrODrOWvGx
 rLSLvzgBopV8X/N5WyhNgTijMXgUsbkjXs7Hhxa+eCcUdr7nMxosqawHqff7eoR1R276
 hLaw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXSa8rAgWOGnHZLBp1JWdguJiYBcPmhpD9Q+L2lfqJtwBfsQGdm9wZZrjrg5k2dVxZ1+tDJTPES3pQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy541V8wJ5oOlnd3aFW1JDi5LxYvD0GucfqtdL2lLBwUp+pVhd8
 D8gJ1c4HhB2+PvmzYh0fwpStCsp3XJ3sFF1ERAiFJsRSrI18swq7r+xr9mqSDuj/NzKjFjOS3oF
 OovPfYLipTmiG6JzcN8J7aWYAwQdNhy3I5DPr1uWRzrq6l4/wmy/O0kXRONIlCK/M15Q=
X-Gm-Gg: ASbGncswN/jHl32nGxhCr5j68/9T1BHBJ06fpEjm10kSsCIufqK/tCnS1Tf5N40mf9I
 wS5vqrZhugJrAJBuk9NhIXh8oQAITgnuKaZT59ckIhkABAtoD9WPpPxygahuYGadH2SLCrFu18O
 pH+3BJngKnYpuROUyI5wC+oxalLLWzYGQWQYfdApSGL/98ZKR1l85+N4e7iZ+BQ+rKPZT9Z5dqE
 T+aOSR0zAEUx7n27gbBNB7A/3CcshUH4q8+O/B5YJmWjKrGeo0RrcW6sihzuL9US9vY6WNAechJ
 im4uiN2U2Ugwz95HNQw70zWrULxj0IWad6fyDA4EUetBbe8jfzr9OMifjtCc/MWS7IjvR+s8wE8
 U8Zo=
X-Received: by 2002:a05:6214:cc8:b0:6e4:9b59:d9ce with SMTP id
 6a1803df08f44-6eb3f2858e2mr61755146d6.5.1742578656900; 
 Fri, 21 Mar 2025 10:37:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGADBjRs3rs94/YLnkpOq24pSnDwxMlG2hCY2p4qMNbSXk/dzNtWVVKJ5jRUhsoAdgTEJUHRQ==
X-Received: by 2002:a05:6214:cc8:b0:6e4:9b59:d9ce with SMTP id
 6a1803df08f44-6eb3f2858e2mr61754516d6.5.1742578656395; 
 Fri, 21 Mar 2025 10:37:36 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54ad6469104sm226950e87.20.2025.03.21.10.37.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Mar 2025 10:37:34 -0700 (PDT)
Date: Fri, 21 Mar 2025 19:37:31 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ayushi Makhija <quic_amakhija@quicinc.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 robdclark@gmail.com, dmitry.baryshkov@linaro.org, sean@poorly.run,
 marijn.suijten@somainline.org, andersson@kernel.org, robh@kernel.org,
 robh+dt@kernel.org, krzk+dt@kernel.org, konradybcio@kernel.org,
 conor+dt@kernel.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, quic_abhinavk@quicinc.com,
 quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
 quic_jesszhan@quicinc.com
Subject: Re: [PATCH v2 08/10] drm/bridge: anx7625: enable HPD interrupts
Message-ID: <lkeezxmjs6qn36qzhmvmtngvrxuwng53rgcb75centx6ds5h4d@dx2iz4aqrcho>
References: <20250311122445.3597100-1-quic_amakhija@quicinc.com>
 <20250311122445.3597100-9-quic_amakhija@quicinc.com>
 <5hvpacx3qeqhjqemhqizws4esdhwg7reli77qey2nin2fggljp@ykgyayj2v3e6>
 <3abefb09-c1b6-4339-8cd9-cd86652c35d6@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3abefb09-c1b6-4339-8cd9-cd86652c35d6@quicinc.com>
X-Proofpoint-GUID: Bc6DoOlyLW6TYpHd9744Tk_hgPZ42mWX
X-Proofpoint-ORIG-GUID: Bc6DoOlyLW6TYpHd9744Tk_hgPZ42mWX
X-Authority-Analysis: v=2.4 cv=PsuTbxM3 c=1 sm=1 tr=0 ts=67dda3e2 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Vs1iUdzkB0EA:10 a=R25bk4NhV3WDM544LqcA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-21_05,2025-03-21_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 phishscore=0 adultscore=0 spamscore=0 mlxscore=0 lowpriorityscore=0
 bulkscore=0 clxscore=1015 malwarescore=0 suspectscore=0 impostorscore=0
 mlxlogscore=780 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503210129
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

On Fri, Mar 21, 2025 at 02:36:21AM +0530, Ayushi Makhija wrote:
> On 3/11/2025 9:09 PM, Dmitry Baryshkov wrote:
> > On Tue, Mar 11, 2025 at 05:54:43PM +0530, Ayushi Makhija wrote:
> >> When device enters the suspend state, it prevents
> >> HPD interrupts from occurring. To address this,
> >> add an additional PM runtime vote in hpd_enable().
> >> This vote is removed in hpd_disable().
> > 
> > Is it really enough to toggle the HPD interrupts? Is there any kind of
> > programming that should be moved to .hpd_enable() too (so that by
> > default the bridge doesn't generate HPD interrupts)?
> > 
> 
> Hi Dmirty,
> 
> I couldn't find the ANX7625 bridge driver datasheet, where all the registers information are present.
> 
> As per my understanding, we have anx7625_hpd_timer_config(), where debounce timer registers are getting set, which help to manage the detection and stability of the HPD signal.
> 
> anx7625_hpd_timer_config() is getting called from anx7625_runtime_pm_resume().
> 
> anx7625_runtime_pm_resume
>    anx7625_power_on_init
>        anx7625_ocm_loading_check
>            anx7625_disable_pd_protocol
>               anx7625_hpd_timer_config
> 
> So, I think HPD programming is already taken care in anx7625_hpd_timer_config(). anx7625_runtime_pm_resume() is getting called for both eDP and DP configuration. 
> 
> If you suggest then, I can move the anx7625_hpd_timer_config() from anx7625_disable_pd_protocol() to anx7625_bridge_hpd_enable().

This might result in HPD signal being generated after invalid or
improper timings. If we can't get a feedback from Analogix on how to
control HPD generation, then it's better to leave it as is.

-- 
With best wishes
Dmitry
