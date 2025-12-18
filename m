Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B516ECCC18E
	for <lists+freedreno@lfdr.de>; Thu, 18 Dec 2025 14:49:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C1BD10E8FC;
	Thu, 18 Dec 2025 13:49:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ObAwvppY";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WW4O5cFr";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39CE210E370
 for <freedreno@lists.freedesktop.org>; Thu, 18 Dec 2025 13:49:43 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BI8vdwe237470
 for <freedreno@lists.freedesktop.org>; Thu, 18 Dec 2025 13:49:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=445Eu5duRxZZ2Z2+iNHrIZvn
 vItlkOkEEhrbBxq/R3w=; b=ObAwvppYV8TDO379X3NuiD3D0WLk9a4qZDvNf+th
 //iCttlqRrdFt9WFxDg5E5R71nMjUoTY9j0KYkOdE6sPrEoycBos5Z3pxI2RbcWe
 eUrPT7/AyIAJNKbLrUIH4oO/RVw+brXFSocVNXZLkwic9d/UcrMwyLySbIwsfpsN
 K5w6EISraM5Nrll9BekwugPAixD5fuwNFEJM9/rJsEV33dZU4ArtXIeV1EIIsKRt
 NkZ7+ioBSPi38oftci0Pj/KPz13UxpDPQeMrYMoEaF3i/rC1S66f4jDdmFh+81Xt
 N0Zlq8kAPM2SlN55YGk6lbXGUW0sNxxtK68eC6h+zyvJFA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b44x3jjxt-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 18 Dec 2025 13:49:42 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4ee0c1d1b36so35020761cf.0
 for <freedreno@lists.freedesktop.org>; Thu, 18 Dec 2025 05:49:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766065781; x=1766670581;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=445Eu5duRxZZ2Z2+iNHrIZvnvItlkOkEEhrbBxq/R3w=;
 b=WW4O5cFryOCFYdmAXunagLsI+HMp1h9m6apLhyEBXXLqRZpJgRMuHzDF/N9hjEfB8w
 dh0HpRZ/+LTR2Mma2gGzkpvCEHpD7OEH6dpqQ56Db0kQTwHS1DymqFpzRj21BMZuG1NU
 T50Lgmkw8KbgP7WOTo0O+If/gKog+vHlGb6H1SOGBn/muMmr6atcGUlt9KLArImKnDgO
 wi5AB+wrnkjzHgIlfUqCb6k/1m47eeAoHQAuxwny2Xjwi8iDVwJhm1zSfE2LFu5SZexb
 14fnDH4YBvDOT938kZkb8wCdpGvtaGoxKxrTR3bl5zEOAKytG2FvSim3DyOKuzuv4biA
 o5/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766065781; x=1766670581;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=445Eu5duRxZZ2Z2+iNHrIZvnvItlkOkEEhrbBxq/R3w=;
 b=rwcCnRlHD68bEs33r302WWLi7z9wDxjEujvNQUK9QA5J2ltCaNW9d2g+b8K4+61Fnb
 8nw5ry2o/4beRfzoNvrEX9cbQiAC0S0AHr4g+o0fzDmLh6XjmoDtwqsq3TpLXco1JB/c
 3t/aXM4dRu7fEN1vjR4KdMgQv05E2UGeDthZOVzMkbZPojXfltPib5PlRWIXg/iXJvrX
 C5s43oWqdLnK9lyyKC1bHab9zca5I+I7lSSORXL7NfnYAk/fQzuQyLMl9tpvXLVO+M85
 vk5t7Jkh/qAFVoYyZzd4b+WoUJKTdopmWPau1jYMd86XbuqBTyGczH19uENCxfOElEoi
 5iyg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUuVDXoJdO7lNvH/CQlsQKO2DuKyI6i1ha42ljaaf/eDybEYBwrhOoHWtBdRKSG12v9qeE/q6tg8Xk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyW0J0YikGNoDCXQ8VDP+ct4vGz9mMCjD/5rarEUqRZWv21fgqE
 IrwnZ9M0Yqnu2d6xIYzq/HDs2Jw31zwOuEUy9n7rJdr+AuA9zDo0ewvPJ1uDAlOdbjAfLtvx6KC
 QyNHptQ64f1LVIROW5kFdFjvCLcXYHBS/p4ix7+5bQ1SQ4vdiMkPiwOqiHgg1qycKhBXaMZg=
X-Gm-Gg: AY/fxX6NSL9x+V0JecyB321OD3dVHLtkwqQRMQiLFsizJh3JsMBud12GAsgiuLieuoz
 iY7y9Ve/tmArQScoIyRb3kLGvGvhObvUSRduLFEgB92kblSXYH3pWarBLqNKF1QbriDTqVO636I
 ioGOTZ7K6zVAJuzKjNvJV7oBF+c6bierAws7rzFsCGLk8y8gUyCJYn0iqjVMar3nhgO8cFcfAsK
 AUoENq0SDLiexvCmCuetJCs9sPazaE6gdn6u5zhTABF40LgH2/MiRv7fU99m4kGwMMmQw1gc3EU
 2Zpg2mFT2Pwkq9TI9SMphJF3Z91DtiCPTVUTxo3+8li6B8BwdBN0E1RdNqShUd91R8bfrRWfW3D
 1KUvu8NjQqu/Ra0Etnnp3jQmlzc2vkSvsBTc1uEMRXh+RWsUjXOdE9/X7IV5Bcx7cHNjLFA0NTY
 AR63ed2Z0wr6iuGC0l19DaBcA=
X-Received: by 2002:ac8:7dc6:0:b0:4f1:8412:46e2 with SMTP id
 d75a77b69052e-4f35f45578bmr49489201cf.29.1766065781328; 
 Thu, 18 Dec 2025 05:49:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF4SSTdlfiBcgtQ/sTaTy0ysl/PcwJDZMzMlU9COTYmy0R43ZsOc1KqN592StzDqEnGdb2NVQ==
X-Received: by 2002:ac8:7dc6:0:b0:4f1:8412:46e2 with SMTP id
 d75a77b69052e-4f35f45578bmr49488851cf.29.1766065780861; 
 Thu, 18 Dec 2025 05:49:40 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-381136e2c55sm10176481fa.30.2025.12.18.05.49.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Dec 2025 05:49:40 -0800 (PST)
Date: Thu, 18 Dec 2025 15:49:38 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Alexey Minnekhanov <alexeymin@postmarketos.org>,
 "marijn.suijten@somainline.org" <marijn.suijten@somainline.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Paul Sajna <sajattack@postmarketos.org>, barnabas.czeman@mainlining.org
Subject: Re: [PATCH] drm/msm/mdp5: drop support for MSM8998, SDM630 and SDM660
Message-ID: <7dcs7n4pbdhmm4ujgqnek4setujzqxhkdsf3tuf4ggymajj3rj@xzapix7ujzr6>
References: <20251211-mdp5-drop-dpu3-v1-1-0a0186d92757@oss.qualcomm.com>
 <8e1d33ff-d902-4ae9-9162-e00d17a5e6d1@postmarketos.org>
 <dcapydafye2v6owrkehngivqlucjcx6aa3sszszflh3ocm7dpq@qsajm2qkc52d>
 <24f29ff0-99d0-4175-a6c9-f402ce99f645@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <24f29ff0-99d0-4175-a6c9-f402ce99f645@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDExNCBTYWx0ZWRfX6+aG+6BVKwEB
 DMshjwfRA/cQomPQ5OCjZ6Hh95x7akZxvvxHruPkDE/HSSAUJJ+DREldeUMNeOK1NrSl+iaRQli
 4zYgN0mfQg4Umka6zjgVCtU+aEHIgdqal8Tzol7rx0O6HPfMZS840d/vfnuGS8mlbRbMlrox25v
 N4gKJaTRH6zdP6I5uj1kxtWtkej9XOYoyJuwrWS3FGEtL9BiuCXB/gmBGLKftuWWEutd5NUchtg
 k3TWxpj4fChHrcw1Kz6/op76uMASbB8U221nxU2oQzFXh6A7cqkw0w4HJN3eO7jAkKXibJD7tnU
 cE/smdCo71bMg4NkKLhsRYjHsn4NfHq36Pp9kw0upZRecRl/m1iDe/6aobTLLxkEHwZxZtxtcqF
 W42c5oh6FeAr+dYLHf5BUKWNEGDW+w==
X-Proofpoint-GUID: TKNfVV2ggRSVqdSVEWZQBE4eptcDa1Nl
X-Proofpoint-ORIG-GUID: TKNfVV2ggRSVqdSVEWZQBE4eptcDa1Nl
X-Authority-Analysis: v=2.4 cv=Zpjg6t7G c=1 sm=1 tr=0 ts=69440676 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=Q4OzpPgPSF-fUoI1-2YA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_02,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0
 phishscore=0 malwarescore=0 clxscore=1015 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512180114
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

On Thu, Dec 18, 2025 at 12:23:49PM +0100, Konrad Dybcio wrote:
> On 12/17/25 5:34 PM, Dmitry Baryshkov wrote:
> > On Wed, Dec 17, 2025 at 06:05:31PM +0300, Alexey Minnekhanov wrote:
> >> On 11.12.2025 04:25, Dmitry Baryshkov wrote:
> >>> Currently MDP5 3.x (MSM8998, SDM630 and SDM660) platforms are support
> >>> by both DPU and MDP5 drivers. Support for them in the DPU driver is
> >>> mature enough, so it's no longer sensible to keep them enabled in the
> >>> MDP5 driver. Not to mention that MSM8998 never used an MDP5 compatible
> >>> string. Drop support for the MDP5 3.x genration inside the MDP5
> >>> driver and migrate those to the DPU driver only.
> >>>
> >>> Note: this will break if one uses the DT generated before v6.3 as they
> >>> had only the generic, "qcom,mdp5" compatible string for SDM630 and
> >>> SDM660. However granted that we had two LTS releases inbetween I don't
> >>> think it is an issue.
> >>>
> >>
> >> I've retested DPU driver on our downstream release based on 6.18 (by
> >> using msm.prefer_mdp5=false kernel cmdline parameter) on all devices
> >> at my disposal, and I can confirm DPU driver working fine an all SDM660,
> >> SDM636 ones, but not on SDM630. Some logs from sdm630-sony-nile-pioneer
> >> (Sony Xperia XA2):
> > 
> > Unfortunately I only have SDM660 and video DSI usecase here. BTW: is
> > your SDM636 / SDM660 using CMD or video panel?
> > 
> >>
> >> [    2.356546] msm_dpu c901000.display-controller: bound c994000.dsi (ops
> >> dsi_ops [msm])
> >> [    2.357328] adreno 5000000.gpu: GPU speedbin fuse 146 (0x92), mapped to
> >> opp-supp-hw 0x4
> >> [    2.364802] msm_dpu c901000.display-controller: bound 5000000.gpu (ops
> >> a3xx_ops [msm])
> >> [    2.444649] [drm:dpu_kms_hw_init:1173] dpu hardware revision:0x30030000
> >> [    2.449793] [drm] Initialized msm 1.13.0 for c901000.display-controller
> >> on minor 1
> >> ...
> >> [    2.911900] [drm:_dpu_encoder_phys_cmd_wait_for_ctl_start:654] [dpu
> >> error]enc33 intf1 ctl start interrupt wait failed
> >> [    2.911916] [drm:dpu_kms_wait_for_commit_done:525] [dpu error]wait for
> >> commit done returned -22
> >> ...
> >> [    3.176171] [drm:_dpu_encoder_phys_cmd_wait_for_ctl_start:654] [dpu
> >> error]enc33 intf1 ctl start interrupt wait failed
> >> [    3.176367] [drm:dpu_kms_wait_for_commit_done:525] [dpu error]wait for
> >> commit done returned -22
> >>
> >> Which results in horrendous ~3-5 fps in shell.
> >>
> >> The block "enc33 intf1 ctl start interrupt wait failed" + "wait for
> >> commit done returned -22" is repeated few times per second whenever
> >> the display is turned on, and stops when it's turned off.
> >>
> >> Meanwhile it is working fine using MDP5 driver (msm.prefer_mdp5=true).
> > 
> > It's interesting. Would you please capture the devcoredump for the
> > platform? There will be a lot of blocks, I'm interested in INTF_1, CTL
> > and top_0.
> > 
> > Also, as a debugging check, would you mind patching
> > dpu_encoder_phys_cmd_wait_for_commit_done() so that it always calls
> > dpu_encoder_phys_cmd_wait_for_tx_complete()? I will check if there are
> > any differences for CTL_START and similar registers, but it will take
> > some time.
> > 
> >> Well, as fine as possible considering [1], using several FD_MESA_DEBUG
> >> tricks to work around GPU issues.
> >>
> >> P.S. I have not yet tested MSM8998, but I can try if required
> > 
> > As far as I remember, MDP5 on MSM8998 has never been wired (as in never
> > committed to the DTSI). Angelo has enabled and Freebox people have
> > tested DPU on MSM8998, but I think it was limited to video / HDMI
> > usecases.
> 
> I think we poked at both, back in the day (tm) and DPU worked on msm8998-
> sony-maple (sharp,ls055d1sx04 cmd mode panel) with the funny CMD mode hack
> (due to a register field not existing on <845?)
> 
> https://github.com/SoMainline/linux/commit/14e0517e2fd5eee116a32db624b09856c60fa022

Ok, so my guess was correct and CTL_START is not present there. Checking
the regmaps, there is no intr_start too. Let me cook the patchset.

> 
> FYI panel wiring:
> 
> https://github.com/SoMainline/linux/commit/88f276e81cea0f7496d3f92cd731f27615cfa703
> 
> +Marijn may know more
> 
> Konrad

-- 
With best wishes
Dmitry
