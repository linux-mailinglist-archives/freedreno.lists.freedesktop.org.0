Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C23B1F33C
	for <lists+freedreno@lfdr.de>; Sat,  9 Aug 2025 10:20:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8F9D10E296;
	Sat,  9 Aug 2025 08:20:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="MAGfaBA8";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 957A710E146
 for <freedreno@lists.freedesktop.org>; Sat,  9 Aug 2025 08:20:41 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5794fSC3013152
 for <freedreno@lists.freedesktop.org>; Sat, 9 Aug 2025 08:20:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=2H9KRizh8IleLkCoQjNl9JsL
 yZ+FWKuglV3/DdZPO8Q=; b=MAGfaBA8T+Ra1m1wA7iBsHcVPnWichOrkJ6Hwa2P
 MDJWxFoJIyAChoNv7Whs+9DgoVdmCqEWVu91q0gSjXWHwtBMxxa7RuLZiUtG8Fag
 QMcPIvqAgLjCrqE+tFwUV9trMjCN/M9RtQpFw/Z9rPC9azPkItP4yxOT2P00z3dO
 +CHGX8SCr3dCjUy7dEKxEjs01qM7fNulbQI6Js+koHbfqr0p4BNRbI0ecCQoCLI1
 1GsUbAyQKCLD1ohKLTUErVQCdGt89ERmq7byNZcOKB6YrpPAFQHOFn8Zqzkt/SJk
 EVpAvcE8TihcMBj3HLOMv+ayG5eEIRvv2Pku9ZniMjOZKA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dygm88b7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sat, 09 Aug 2025 08:20:40 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4af18aa7af8so72672341cf.3
 for <freedreno@lists.freedesktop.org>; Sat, 09 Aug 2025 01:20:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754727639; x=1755332439;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2H9KRizh8IleLkCoQjNl9JsLyZ+FWKuglV3/DdZPO8Q=;
 b=glZOUJ1JtcA8Tnh46pBuyZ6bfY8Mevu18Am/JS/ds6QGQ3JDuuIz7sx5mZygwCVZu5
 LXAnuimheqCXPiSCYWdou6onn1g6O8ssoQ80kYwxaH6StHZVb8+KU72Zni0NpuHUS8N5
 JN1iIJMqfgtGWmjdgqTESGHhc3kAvFcjubs9I4Lr8PPycTQC7PAoOOhS6Pl42wcXKWaW
 eLRlZMZVhndttvl5s9/gX+p3Doi5+vle0oJ3gttTU+CFRMJEFggsVuriyuu9W3tKSW04
 y/F6WTaoUqEOo43XWblM0S/u6IXy7MG2ptTQiPmE2pbwTMsqE8OR3IhgORTZ7+H5otpt
 ckVw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXuNA1zNWan+ab9w8vMhMysxgC+vQP5tc6P2tLo8TQy9pYL603wIqqiCHLeDjH06BCgfH3V5H+bEmI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxbte1SsgI768LGnzOu/ay4v5/gJ+2xtVow86T10OnZpOG7aFk1
 LVFUy9E+cPBTfXHoWhOel9bIZ1ypv3J5Vvz5e0FNZ6ZN8qAqeFjJKUWjApns9iEQ5DwgEujjVjy
 cABWxI5LWuko3AaKbRgfl7NPMRFMyaYuCe2dQwgypw5G5WIMSCh+hHMreGmnAsWKkpxH94RM=
X-Gm-Gg: ASbGnct/c69zqbzJdAozs/F5EqiuCTkAO3OgPirGE8hbnEds3pa4zL0jHeV4swSwwLv
 PrZrLdc325j8FgnpDYnjqAONhOBTod4kEswyG6Bw0/j3gskRGQeVQfRGivgexsaE9NoFf2yp1E1
 MWBb7W+Ioq+kTdLJoieRPLm1jeLHd2U91pR0Ac7BEF2Bhc89wO15EKK8LvVMlGRyntftPlGT37/
 qeI+hE4rytaim3MujKS8gDzXbCKqokcviRyYN9R8Q56D1JZ1LhgHpKsVThVM3MycGB8pUyUsQB3
 j1LcaJA3V0xFFOg7dsfr3MaovFVcc1ab6qzgqbe7HnP/iGA+3pOotE+LsG9EqQCl8+v59YobuQP
 XSn4WiO6QwpdhWLS+I5qyIfzP9a4ZXE1rR1Y1MrkwdLynsBiOI6sw
X-Received: by 2002:a05:622a:20c:b0:4b0:6d53:a0fc with SMTP id
 d75a77b69052e-4b0af4deaafmr103917351cf.7.1754727639472; 
 Sat, 09 Aug 2025 01:20:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGaybZqS8e1II26PBLtR2MEev8RqN/YcLWWOjMTMd4jMxYQpAM2kTd+wUuQlaFFQ87m9qtgiQ==
X-Received: by 2002:a05:622a:20c:b0:4b0:6d53:a0fc with SMTP id
 d75a77b69052e-4b0af4deaafmr103917111cf.7.1754727638990; 
 Sat, 09 Aug 2025 01:20:38 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55cc8d64512sm146866e87.11.2025.08.09.01.20.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Aug 2025 01:20:36 -0700 (PDT)
Date: Sat, 9 Aug 2025 11:20:34 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Arnd Bergmann <arnd@kernel.org>, Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Arnd Bergmann <arnd@arndb.de>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Antonino Maniscalco <antomani103@gmail.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Jun Nie <jun.nie@linaro.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] drm/msm/dpu: avoid uninitialized variable use
Message-ID: <fcgmsw66wi6eqtcwhcz5yc6migoauygaztqumztseo7uu4a62g@bg5xnnd4eosw>
References: <20250807072016.4109051-1-arnd@kernel.org>
 <ouan6tfmoefwuvs7wmhpzjdwmxfhqh3ad26j5tmwdugnq7ieda@ddw6dfqtq27g>
 <20250807143444.GA1009053@ax162>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250807143444.GA1009053@ax162>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAzNSBTYWx0ZWRfX/zOCSx67FOyV
 nTZ6OBmATFthZyrGnolV45foG3B7EBRXCRgdZiLMfwbuPemQ65Ob1kuk/L+F931onP2QZBL1cRX
 3mrN2+JPiOWxgaJLFmtJZ942V//Gz1WDgRM2ro1fZPCu6cmvje13Yu3PF/m5BcWwdi3gvvyUXOq
 DFEXspajfPgvTLqSILyXnEezm7fXXklISsLOHJoZWgtyqLRzRJ6Xf29BYm/028VEbbPY4AjJOHh
 MFSIQymY2xTJnjCdfaNxDaPkOlAwb0SYTHKlY/qFroDCuoT/ZpU7krpidWRhGUeVDU3iMyj4g1v
 qZwafN3ZV3vKmXA3qfQD3aZJUUK1xo0fB88zFAtrlyNLWj5KPNsqhHxbleh9VBBaEFfivnqpOds
 0BntjMtJ
X-Authority-Analysis: v=2.4 cv=FvMF/3rq c=1 sm=1 tr=0 ts=689704d8 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=yl-pN8RVu-4QMKwhACwA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: cgSAns_wGOsG_BvCL2Wfrod9Yy8wQfe8
X-Proofpoint-ORIG-GUID: cgSAns_wGOsG_BvCL2Wfrod9Yy8wQfe8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-09_02,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 suspectscore=0 phishscore=0
 clxscore=1015 impostorscore=0 spamscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090035
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

On Thu, Aug 07, 2025 at 07:34:44AM -0700, Nathan Chancellor wrote:
> On Thu, Aug 07, 2025 at 11:09:38AM +0300, Dmitry Baryshkov wrote:
> > Having no plane->crtc is a valid setting and it is handled inside
> > drm_atomic_helper_check_plane_state() by setting plane_state->visible =
> > false and returning early. Setting crtc_state to NULL is a correct fix.
> > Could you please send it?
> 
> I sent this fix three weeks ago, could this be applied?

It will be picked up for -rc2 (hopefully)

> 
> https://lore.kernel.org/20250715-drm-msm-fix-const-uninit-warning-v1-1-d6a366fd9a32@kernel.org/
> 
> Cheers,
> Nathan

-- 
With best wishes
Dmitry
