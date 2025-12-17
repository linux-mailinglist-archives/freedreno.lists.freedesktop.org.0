Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C006CC8CC9
	for <lists+freedreno@lfdr.de>; Wed, 17 Dec 2025 17:34:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 372D910E5BA;
	Wed, 17 Dec 2025 16:34:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="CYDtl8HT";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AdwdlKKe";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3214710E08E
 for <freedreno@lists.freedesktop.org>; Wed, 17 Dec 2025 16:34:45 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BHCKmLR3000449
 for <freedreno@lists.freedesktop.org>; Wed, 17 Dec 2025 16:34:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=EoS2/SEtxcfOVm1nycVOUKsk
 ylsoggbceMpNDql009E=; b=CYDtl8HTW6hJG3zMzleDv/pNLNdGlHA82rjbwhvZ
 SEwQIiBvdo83E5GzBE4lzRK+sAyqJvnXznZTa70si/4Fj10YAL4bC+1ewfakpj8t
 eVoSLkiFKMgam4IXhjRXKAqXjHh4SMOwosdesGpLET0hZRLqTzUVgipgUAeSCS21
 xNC+n2gVtljXXpe60jJ61BcEdeqF40Sm0lEoF4hqZF4xzVTJ8ilewVEpDFKCIGEC
 2oJ/5M9xz74h5JZHLM+uvCPtjrchhflUp1/Or0TKLUm1kV62D+2KSG6kp8so9aql
 yG3CrqXo7vtSLtMNwT6d4xCYym1XQxpKdyLWS7jRqKdF1w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3n332c22-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 17 Dec 2025 16:34:44 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4ee09211413so153176531cf.2
 for <freedreno@lists.freedesktop.org>; Wed, 17 Dec 2025 08:34:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1765989283; x=1766594083;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=EoS2/SEtxcfOVm1nycVOUKskylsoggbceMpNDql009E=;
 b=AdwdlKKeDuiM8K7gPPha/uJj5d/ML1LngdyPuGMAsC6IHWSxA/zFQBHFdyO47sEAVN
 0RkTbS8uyR1wFmbry/8oRkG8Cfe4oetyiUzay0IZVN1se2O/8Vjd7viIGlCgRPpcSlZa
 EAQg0yU7+BedhECgUfIlOTAVjyFYbLXQSJcdDCOHtCQoOJOWZ8W1sumPmR+0KmwLBut/
 kt/6/43A+IMCnHy8Tpji/hn7yoysbhIjLjgIHYUQr6Hn5TE5Xu2b53NP0RrH1cXZOkBf
 ESRRZzaUzwEVbI1K3IQEbnMULyvBTQuBol3IXccj50ueVmFek/p1ANDM029VoSyLclPu
 F1zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765989283; x=1766594083;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EoS2/SEtxcfOVm1nycVOUKskylsoggbceMpNDql009E=;
 b=JHsev1TlJ9KExFUAXGBu8dW+3dzhdKRAWGh4hdaczIFsK/LLR96be1XTOEStpn6Zz+
 FuVdCuBZjRtDYRS0K4z0dK1mQoPycmaHi6gfzEx4gpgvtoKr90qqADcLFeFUuKBYb5Dl
 NgGpNBfe85CkC0/qXzChQ7/p57vKvDX8iUhgI/BT47zIKb/It0Frqro5UkkJwUbfpuzg
 SiE3r036O/U5P8Ajc0KRbjRhcPBoYh78vWrVZ4/C0Ig1ielJxVLowUBBEIlktnrFJBld
 sAHW65Kvh8L7LvxmON5JGTbusIKorKhcPvVdykSIFCcnZEd8ThIPdjW1xoTUZfi+/J5a
 L1uw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUaqzwKmfk5u+nitBRMwRMcwZgNnQvHc08nDwOk8fbxkMtYwesw/5J8IK4csur+f2wp+3R6aI8CzEE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyQSBb5q3HFf8JIHZ4l/KC3dYhJKBgtYnBZw1te1LGVzi0DnRuO
 XEKGDZN9e7YSt4VGneMl39zSS8nWlY8oZjjdfozVoxAEdUcj4iz+FFZbnE18DunU+r8mL6+92E+
 LVadu5D/VwYDGd7tDbbhinVnTRriyL/zyKbS6gZhxFXLT38Adjatn7T9MkrlneJQtRiAvEx4=
X-Gm-Gg: AY/fxX7BfTy+gb5TN0pUlcKen04MlcBlABRh5Q2xI0Fjh+Kb4i9Oa8jVlkGXh5yW+04
 fZHjuI1zbtFF1FNsNMS1pXKpUh86ryYMS1q0bjSEOpxPp1gTXhymPEcVozq7hPzVSb7IcksFcIi
 2lsAjfgcxSZpT8Mr48VX8Ip4+1E4//vZD3zY+x2RtuRYnYMGJ0ONa8Qt6Og+kFfHm41mU+GDXpl
 kTPduUponqH2I6AV4wNpaRWUbi+EyjGdWY5b9yuWrV+cRuhiwoNCSwJRf5zjxkh+32FRBUxhgMU
 7b6msCV3lG4WNOYBNLcR0Qyql9IqphybEGdEFuufiiAKObDvx2BueeUYXFQzswvB/j/E7T4VVRr
 bA6sk7wRJukMc/5ojjlLwTzHdrr9Dam2/dx7am274K1+WWKNx2ppLJ/5l5tu4REXvcWgeuDlFk+
 kVsudkhd/QxCVpbOjAatGoclI=
X-Received: by 2002:a05:622a:a18:b0:4f1:c72b:284a with SMTP id
 d75a77b69052e-4f1d049ff8cmr220756111cf.15.1765989283262; 
 Wed, 17 Dec 2025 08:34:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEsAAJHwqxmftk+OQ1zGcEv9EePgWku3/QTaYBqJtm4eCKo2EQ/iMJ21n1xekg/vIL0bnve2g==
X-Received: by 2002:a05:622a:a18:b0:4f1:c72b:284a with SMTP id
 d75a77b69052e-4f1d049ff8cmr220755741cf.15.1765989282670; 
 Wed, 17 Dec 2025 08:34:42 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5990da5dcd1sm2503254e87.81.2025.12.17.08.34.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Dec 2025 08:34:41 -0800 (PST)
Date: Wed, 17 Dec 2025 18:34:40 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Alexey Minnekhanov <alexeymin@postmarketos.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Paul Sajna <sajattack@postmarketos.org>, barnabas.czeman@mainlining.org
Subject: Re: [PATCH] drm/msm/mdp5: drop support for MSM8998, SDM630 and SDM660
Message-ID: <dcapydafye2v6owrkehngivqlucjcx6aa3sszszflh3ocm7dpq@qsajm2qkc52d>
References: <20251211-mdp5-drop-dpu3-v1-1-0a0186d92757@oss.qualcomm.com>
 <8e1d33ff-d902-4ae9-9162-e00d17a5e6d1@postmarketos.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8e1d33ff-d902-4ae9-9162-e00d17a5e6d1@postmarketos.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDEzMSBTYWx0ZWRfX81QG3E920ldE
 /YgqnMSgPuXEGGAH8T7MaRqgkWKNbyrSfyEb5OaPDHu+qKGKI0tTUHBDgiCT4Cky8gKUNV7B3GM
 wfAoGOVEZiCxPEk9ggs2nqGDz4hEfDnVT44Zkrv8Gnv1RwhI3sUYwAB88qQcb0Het3yjbo32Aua
 MsM7HZvHbD92nA5K3Hn+c339D6c336/CJSja/kx5d9QYNFzUc24DBz+JPeHGgpDze/TFv4T8OHe
 YC/t4C67PLA0KTqTboQolhg/AOtIOSaeZDLOsHtonE5bvSgHZLbnLv56vUpsTSbL30ebmkzNbI1
 ytuEPSfzzrRBMUmYaKopngHRNNmqscVCch1w2W3GYy6bsUIkUQmGz+UZyGPBxJJlSwhSfZk5Ljs
 KBjLjZ78KKxlLgzZmj3SZyc4pAAQEA==
X-Proofpoint-GUID: 239AKQSIew0D3uZfUsY9YCGQGchb7Kkq
X-Proofpoint-ORIG-GUID: 239AKQSIew0D3uZfUsY9YCGQGchb7Kkq
X-Authority-Analysis: v=2.4 cv=U82fzOru c=1 sm=1 tr=0 ts=6942dba4 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=e5mUnYsNAAAA:8 a=jsZ3alcmfn4h52Hz5qMA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_03,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512170131
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

On Wed, Dec 17, 2025 at 06:05:31PM +0300, Alexey Minnekhanov wrote:
> On 11.12.2025 04:25, Dmitry Baryshkov wrote:
> > Currently MDP5 3.x (MSM8998, SDM630 and SDM660) platforms are support
> > by both DPU and MDP5 drivers. Support for them in the DPU driver is
> > mature enough, so it's no longer sensible to keep them enabled in the
> > MDP5 driver. Not to mention that MSM8998 never used an MDP5 compatible
> > string. Drop support for the MDP5 3.x genration inside the MDP5
> > driver and migrate those to the DPU driver only.
> > 
> > Note: this will break if one uses the DT generated before v6.3 as they
> > had only the generic, "qcom,mdp5" compatible string for SDM630 and
> > SDM660. However granted that we had two LTS releases inbetween I don't
> > think it is an issue.
> > 
> 
> I've retested DPU driver on our downstream release based on 6.18 (by
> using msm.prefer_mdp5=false kernel cmdline parameter) on all devices
> at my disposal, and I can confirm DPU driver working fine an all SDM660,
> SDM636 ones, but not on SDM630. Some logs from sdm630-sony-nile-pioneer
> (Sony Xperia XA2):

Unfortunately I only have SDM660 and video DSI usecase here. BTW: is
your SDM636 / SDM660 using CMD or video panel?

> 
> [    2.356546] msm_dpu c901000.display-controller: bound c994000.dsi (ops
> dsi_ops [msm])
> [    2.357328] adreno 5000000.gpu: GPU speedbin fuse 146 (0x92), mapped to
> opp-supp-hw 0x4
> [    2.364802] msm_dpu c901000.display-controller: bound 5000000.gpu (ops
> a3xx_ops [msm])
> [    2.444649] [drm:dpu_kms_hw_init:1173] dpu hardware revision:0x30030000
> [    2.449793] [drm] Initialized msm 1.13.0 for c901000.display-controller
> on minor 1
> ...
> [    2.911900] [drm:_dpu_encoder_phys_cmd_wait_for_ctl_start:654] [dpu
> error]enc33 intf1 ctl start interrupt wait failed
> [    2.911916] [drm:dpu_kms_wait_for_commit_done:525] [dpu error]wait for
> commit done returned -22
> ...
> [    3.176171] [drm:_dpu_encoder_phys_cmd_wait_for_ctl_start:654] [dpu
> error]enc33 intf1 ctl start interrupt wait failed
> [    3.176367] [drm:dpu_kms_wait_for_commit_done:525] [dpu error]wait for
> commit done returned -22
> 
> Which results in horrendous ~3-5 fps in shell.
> 
> The block "enc33 intf1 ctl start interrupt wait failed" + "wait for
> commit done returned -22" is repeated few times per second whenever
> the display is turned on, and stops when it's turned off.
> 
> Meanwhile it is working fine using MDP5 driver (msm.prefer_mdp5=true).

It's interesting. Would you please capture the devcoredump for the
platform? There will be a lot of blocks, I'm interested in INTF_1, CTL
and top_0.

Also, as a debugging check, would you mind patching
dpu_encoder_phys_cmd_wait_for_commit_done() so that it always calls
dpu_encoder_phys_cmd_wait_for_tx_complete()? I will check if there are
any differences for CTL_START and similar registers, but it will take
some time.

> Well, as fine as possible considering [1], using several FD_MESA_DEBUG
> tricks to work around GPU issues.
> 
> P.S. I have not yet tested MSM8998, but I can try if required

As far as I remember, MDP5 on MSM8998 has never been wired (as in never
committed to the DTSI). Angelo has enabled and Freebox people have
tested DPU on MSM8998, but I think it was limited to video / HDMI
usecases.

> 
> [1] https://gitlab.freedesktop.org/mesa/mesa/-/issues/8442
> 
> --
> Regards,
> Alexey Minnekhanov

-- 
With best wishes
Dmitry
