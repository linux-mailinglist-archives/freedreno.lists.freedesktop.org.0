Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cB77EZNhp2lvhAAAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Tue, 03 Mar 2026 23:32:51 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E3441F8020
	for <lists+freedreno@lfdr.de>; Tue, 03 Mar 2026 23:32:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2B7710E8E6;
	Tue,  3 Mar 2026 22:32:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="cddr5VaV";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OvQnjk3V";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DE6510E8E6
 for <freedreno@lists.freedesktop.org>; Tue,  3 Mar 2026 22:32:48 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 623H0CqN1256564
 for <freedreno@lists.freedesktop.org>; Tue, 3 Mar 2026 22:32:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 1egK9oyG2ALjxRz8MaOfLt1kpaF+JjzamWBrBKBCyUY=; b=cddr5VaVmVXykzRj
 cx3cakWNvDoLzY1BgQ6gMnlzMHsl6giVCxiRmxB1yX7RfXUWK5KTIrVEcu8Vo+RR
 WbYBDWE6FoUCNgwDmEBjp5F2detpVxt5bG7OP3HByXxD9EfS2OdAL0i6EwhkAQ1V
 snA1K5E2vaexC3sZ8Th7G1ytUXjoLh61LmLkdi2zL542CUJcqtu1Znvq6rrQN1hE
 T9/gZRQtL87FmUK1MF7eIQNZcgqMttFtexF91IuaEiEM7mSYSx7ztvai/KeabxGZ
 SRXx80+A93HtAHidEx3ghNo9mMQixHb1hjlOnb3oftRQQpfKBcRLomPTuvobhpin
 zcNMmw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cp2c9hejn-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 03 Mar 2026 22:32:46 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-506a9bf9b3aso59851101cf.2
 for <freedreno@lists.freedesktop.org>; Tue, 03 Mar 2026 14:32:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772577166; x=1773181966;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=1egK9oyG2ALjxRz8MaOfLt1kpaF+JjzamWBrBKBCyUY=;
 b=OvQnjk3VGlB8gg+shXXq3CAIGFng2q+fUVi9Lt+gt/wqF6f0akkmy7VD6WNJFhndH0
 eG20LDLO7Bn6sUqvlxt8GbWcnWB0ol7UXkPSPBUWcstwWBJHbcXfRZJrIBGs70Z4l2Nw
 8qWCYoTkWMkbRdQhOsAvdro3vxjD9SBjJRNEbVK55T3ntqUp63Q2JZ8yuSEsKCvH7QWM
 UlV+4eAJgCMAmvdGTWFybvkLnDTwoZ75/uRO0hUcPWr64yUQNtAsLpZj46h41RSnaGpy
 TlHqxoN0L9IJvDDr68yxPhML9CNx+Wtb1vFwH6sjCSnXxFp1Jz8lQSWYHiV7nbvV2wrA
 psCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772577166; x=1773181966;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1egK9oyG2ALjxRz8MaOfLt1kpaF+JjzamWBrBKBCyUY=;
 b=oOuI9BkuTNPuo6La0UXfOGR7+wJ8+NGaGTDKhIK1YJC3a9Jk3qP/2nUn8svd6g2j04
 e37VGj0Jh0NpdBIA2uo3lLaQ3Hc+HJuqO3K543Mf8ODYCcopdoYvy59b+ZCHTvHa671l
 7eOfVi0W3pnKDiD441nUsp8LTKSLRF+S7+a7vGOMzapMPXzmLpO4vd7ibJunmXRnMfuN
 PJ3DEMpySnmYjY4luxha00OTGB+eE9rESJuVIVh+U0hwSEAGqt5krfBZKsoiib2QFVMZ
 8jcTBj/y16a5UEVJOoHm2GUWZQALPb7pechmJp6bpZv6Sh+DKajll13Nc3QWpZM6iecK
 AKfg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVFFTV9Vwbh0yw6nZKWrHVHytOaDLKv2NT609srk02kUQWv4qe/ELOkpWMO7hKXK8pHLV/vKtQeZYg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwxpgCH8EBoLS00oq6z6xisMaPgTveylNi6+9LYrHC27019GdN/
 bKWm+T0waYKGolcJaGd1UCCSQiVfIXFnBVVdcKw6bttDbOdodVq6bVuZzWCwadr/d/SxNrgQ3ZF
 DKKbrqK/sA6vQsCFLu3+fXg2kxvPSoYLyZR7qtRLIPJlr21+uanNIozvNI+kb4xz8nGmONbU=
X-Gm-Gg: ATEYQzyjCPwo2mq5ock3f/3JmpJK0pL4HPfFUURVFkBDRnXU/XNmwoTuSJviUhIgUps
 VcMC9fWsNJaUCj7yE594WuQH+tEB73r8Y4YOynsFNwmwa3/JBhCR7T//yNoCYGJoW2rO3duD37m
 zdu92p2W7SC8lm7zNFywuN7mwnwEgIs0oeuH0lp5yx0bh2y5dbggVLeTsiFPP7ioSPcVln+MvOt
 AdhCII64OK+mD54OJ8ZHxeJPwJKcQ2cL2T5PdOcbsoequUXlHISBPWsY9+i5Mj02WeBaVvzBpQ7
 hthvpPGkhUOetECny1j6MvnhQ+0d6y692AyKqJfKCAnooQXGX5RNwVoHMvqER3ExxJpjR5Qg3Ya
 1Bcu9KX1WYA+LtVPDJhAlU1GlzUKzqvEs51g5jwKbmtUCJsUT6op9IHw2DlKcUKLUm8isdGtmie
 GLRpmnw2M9yw5nnXz4XAiIho73eKVv2inGT4U=
X-Received: by 2002:a05:622a:118c:b0:506:a4f1:32a9 with SMTP id
 d75a77b69052e-508db2c0253mr193661cf.31.1772577166289; 
 Tue, 03 Mar 2026 14:32:46 -0800 (PST)
X-Received: by 2002:a05:622a:118c:b0:506:a4f1:32a9 with SMTP id
 d75a77b69052e-508db2c0253mr193331cf.31.1772577165819; 
 Tue, 03 Mar 2026 14:32:45 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a1237b81b0sm844996e87.50.2026.03.03.14.32.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Mar 2026 14:32:43 -0800 (PST)
Date: Wed, 4 Mar 2026 00:32:42 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <rob.clark@oss.qualcomm.com>
Cc: Mahadevan P <mahadevan.p@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm: enable separate_gpu_kms by default
Message-ID: <7q7czu7kwkmnnx3ntuduxf36lkzod4mph7ky6334xarbipivcp@3jfhc6ahdhbr>
References: <20260223-seperate_gpu_kms-v1-1-e8231e7f1685@oss.qualcomm.com>
 <srjcr7fosp2zvkpw4q63tbguu3edrg6ojv5zabtjbej5lr5opq@slodmuzofzyi>
 <CACSVV014AxTbB-M-Tg4X0yn=kUFnEncdc+Oc=kKrOevuAKJmAQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACSVV014AxTbB-M-Tg4X0yn=kUFnEncdc+Oc=kKrOevuAKJmAQ@mail.gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDE4NSBTYWx0ZWRfX0JIJwzg0ctTq
 HFEsW/8istwLABx11mm2Ao5A1oveOTD9GzE3K9pWKuWzib9DsON84W7lLMnj/+ONI4KeJqJhNA5
 U6vv1A3OVhbNPm6EJ4Zqy0gqVzrYXrH7VaclLJ5QgoWBP0v8Dcqhw7UEGPbbUMfYO4ssBzfGzwv
 zItyoItYJa9yxzSetJseTqzJVPE9SuDLBma4JzQ7xj7+bj1Oeg5TLwECPRP/tcdX22nMkci5lo7
 FpIi+B/9bMyGnRzt6Fd1THFN93ReKc56H25GMgwiCeGkqnyUKqB12w+2Q7cA5kXaoxy9SRKvIv+
 J7SvXgGxvDu5Xdwh7Bm92WyMr5vorXvgtyRfgS/QndONmH/2UOdIc2bhXAIZUvKmN5PX4EAOdIc
 Rc1MQwJFzkS1S+NvnPzSqLX3+ibM1tMENYyjQIL1xoUZMKqBO6PUEIscKaa9MbuCWo34HDratdW
 uaFep/aB9dRWI1/uc4A==
X-Proofpoint-ORIG-GUID: qd8OUliK1egbNLgcue3SSCSM8i378rxG
X-Proofpoint-GUID: qd8OUliK1egbNLgcue3SSCSM8i378rxG
X-Authority-Analysis: v=2.4 cv=EefFgfmC c=1 sm=1 tr=0 ts=69a7618e cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=6Tb7KvMF9jvO1snUnhQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-03_03,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0 impostorscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603030185
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
X-Rspamd-Queue-Id: 5E3441F8020
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:rob.clark@oss.qualcomm.com,m:mahadevan.p@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[freedreno@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[freedreno@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[freedreno];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

On Tue, Mar 03, 2026 at 10:35:46AM -0800, Rob Clark wrote:
> On Sun, Feb 22, 2026 at 12:32 PM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >
> > On Mon, Feb 23, 2026 at 12:40:10AM +0530, Mahadevan P wrote:
> > > On targets with multiple display subsystems, such as SA8775P, the GPU
> > > binds to the first display subsystem that probes. This implicit binding
> > > prevents subsequent display subsystems from probing successfully,
> > > breaking multi-display support.
> > >
> > > Enable separate_gpu_kms by default to decouple GPU and display subsystem
> > > probing. This allows each display subsystem to initialize independently,
> > > ensuring that all display subsystems are probed.
> > >
> > > Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> > > ---
> > > Depends on:
> > >       https://lore.kernel.org/lkml/20260124-adreno-module-table-v1-1-9c2dbb2638b4@oss.qualcomm.com/
> > >       https://lore.kernel.org/all/20260217071420.2240380-1-mkuntuma@qti.qualcomm.com/
> >
> > What exactly depends on this patchset?
> >
> > > ---
> > >  drivers/gpu/drm/msm/msm_drv.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> > > index ed2a61c66ac9..65119fb3dfa2 100644
> > > --- a/drivers/gpu/drm/msm/msm_drv.c
> > > +++ b/drivers/gpu/drm/msm/msm_drv.c
> > > @@ -54,7 +54,7 @@ static bool modeset = true;
> > >  MODULE_PARM_DESC(modeset, "Use kernel modesetting [KMS] (1=on (default), 0=disable)");
> > >  module_param(modeset, bool, 0600);
> > >
> > > -static bool separate_gpu_kms;
> > > +static bool separate_gpu_kms = true;
> > >  MODULE_PARM_DESC(separate_gpu_drm, "Use separate DRM device for the GPU (0=single DRM device for both GPU and display (default), 1=two DRM devices)");
> > >  module_param(separate_gpu_kms, bool, 0400);
> >
> > The patch LGTM, but I'd prefer to get confirmation from Rob.
> 
> I prefer to be a bit more paranoid.. perhaps switch this to a tri-state:
> 
>  -1: separate drm devices if there is more than one dpu or gpu,
>      otherwise, single combined drm device [default]
>   0: single drm device (matching up pairs of dpu and gpu if needed)
>   1: separate drm devices
> 
> This way we aren't changing (or breaking) things for existing users.

I'd rather break things and hear about them being broken.

> 
> BR,
> -R
> 
> > BTW: have you tested it with X11? Are you still getting accelerated GPU?
> >
> > --
> > With best wishes
> > Dmitry

-- 
With best wishes
Dmitry
