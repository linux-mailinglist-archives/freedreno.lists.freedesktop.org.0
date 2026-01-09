Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2E9FD0C32C
	for <lists+freedreno@lfdr.de>; Fri, 09 Jan 2026 21:41:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98C8B10E067;
	Fri,  9 Jan 2026 20:41:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Hw6lZDKr";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a2edUGrA";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C10D310E067
 for <freedreno@lists.freedesktop.org>; Fri,  9 Jan 2026 20:41:20 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 609IUjZI007839
 for <freedreno@lists.freedesktop.org>; Fri, 9 Jan 2026 20:41:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:reply-to:subject:to; s=
 qcppdkim1; bh=Hir9brUJpHlA7x/ase7YIvZHRMJOe3oUrJ+uuUbm8s4=; b=Hw
 6lZDKrJ46BEgUBnKqkzKorchH5R3IBD1F77gZyULb3YSoBlzwstHEtdE5PA7lVBt
 ocoEVSMC3zDNrSwIQBouzsnEUmb+AqT6Iyc7rVL5s7EN22cQpM8Lool158nRjbhH
 uXCDw2aLt/igk9m/Tmu68JO1YyrA6oVUAaA6yKraVP7NrQM0Lep/EIQiodeUPGjx
 Pna9HeH7eiUWt9Ar39AumeNOnt11ctdcTbsghpXzjrWBjLe+G3Q1GYfkFiu/XuCV
 nOSryMIFZ/0BHn6jjd4/HWgyWDNzt7EPEjQluDTSgwVKOBejuqkcg+0i0Cabzr7/
 cO67bS6I+2LwAFTxSzag==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjyaqhtu4-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 09 Jan 2026 20:41:19 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id
 5614622812f47-45a6c0f1bb2so6249137b6e.1
 for <freedreno@lists.freedesktop.org>; Fri, 09 Jan 2026 12:41:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767991279; x=1768596079;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Hir9brUJpHlA7x/ase7YIvZHRMJOe3oUrJ+uuUbm8s4=;
 b=a2edUGrA0uCle70hrs5zADhKZtRhDPOqI5wZIaK0OMcwzxNG+CRa44EqTkpAaPb7G9
 k+WsUZx3y1jN8o0cP7kD39fUxYyct8v16cdTQUBfQyWHXUmG18oSpcJwB0Zrz/bFvbP/
 bSXoolP2rhCXX3C9CRFGTovSCtXxrJhu0jqIp5JuvBV3QcVxu9QobzCS/upAH28e2pw/
 ZhrUBK/WA4ZEovZq/9pFThyWkyHLBOJeb+H7YjW5lokyZfvxI5Ycu50LjeNSVtl8fuYN
 Oxgb6vlHWQAJR3Bb9pUZjvYtOu+j8H4Vi4dTSpLlaqRuSd65V96yxSpCqRiU7P1P3NbS
 JRUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767991279; x=1768596079;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Hir9brUJpHlA7x/ase7YIvZHRMJOe3oUrJ+uuUbm8s4=;
 b=LfcwBZjRNBt743Tn3PV66eA1mXWFq0xPnhvhxpF5duc6v0Bb8ZK7Y9P7liG1Acgbwl
 7X7giQvw0iur+BPbACTcbFbLLo+7LIScWPOVQYzFbyb4KTD/gJGTn5TM4rZGo4zn5203
 sU/Tj8myrRSPfzGY5bczD9gAZ7zh01PtC/khJAg9W8aU9nATtLrz0T5zAITwTs8FfWKU
 yhehZngogVbke4/WWYUSqAXQOUBpNU2D8ObaHfHkcKX/mc+zEJakom6I8VKk9ay/21oI
 qu789pF3KoJyMNUESt11N7MQcBzf5qJdu/7rc8ROcfsoYs8BwSkJVD4K9/N2AxgnQr5u
 WPSg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWnCwrnDzdUwzydSvlXzwfWgDLyv25xsg/Y40QD5wN6vmdNaOQC9wcrQ5uP+6KHVgE/AFFuEAMzL3U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxlm0X5CZEcmYnjewR3sVcuJBCBTSsqnb7ZL9cB18/2Qqsdebr/
 IB6aTlKFcY2Ay+iHTkHfdQiNfpcpR5rA4KMrGJmDzhHRSzclGFkakZWcr/taB4ITpiFJbPX53ht
 DYklUVVDUy3yVN/ClVtNpNMOqJk+L2b4J4lc4NedEWmHhvp6n3KPZHDzze5UYfmZsKme0UckbTi
 KiZxuE0uuKmGykMKij4eft1pFiQESAu+DDg7S+27dfkXNyPg==
X-Gm-Gg: AY/fxX6zgx/rQ0daEazTTHam+w2n2Of7qGtMAnn2Gi3jqfqwEfe4qZUw+r5MK/DoTco
 Qu6bJMpZSuhibH0aKRd0OdyzEgjEheYeTk1aIkyarw69MmQYsapCYt+6x0L5onnqCCkm7IcrvR3
 srUe/cIaJ0ZhM7yyG1n9UEFVEESdAZFjQtOtaYHnzNJfIiocyxlrIwG5AzhXnU8T1iyA==
X-Received: by 2002:a05:6808:c16b:b0:453:7404:90bf with SMTP id
 5614622812f47-45a6bd85759mr6083962b6e.14.1767991278959; 
 Fri, 09 Jan 2026 12:41:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHpfhjiKOuT+qlJfi6rYssjk7Vc0RpE22HCOpT+0NSEG6xwpBeSi/q77IqnzuKXXx8CpL/quxvWSJlWHLbx7ow=
X-Received: by 2002:a05:6808:c16b:b0:453:7404:90bf with SMTP id
 5614622812f47-45a6bd85759mr6083932b6e.14.1767991278592; Fri, 09 Jan 2026
 12:41:18 -0800 (PST)
MIME-Version: 1.0
References: <20260108-topic-smem_dramc-v3-0-6b64df58a017@oss.qualcomm.com>
 <CACu1E7EDmLPhUFyouD=W6n+U7=oo7+6PY0Gz9=3pVpT2Qu9Z6w@mail.gmail.com>
In-Reply-To: <CACu1E7EDmLPhUFyouD=W6n+U7=oo7+6PY0Gz9=3pVpT2Qu9Z6w@mail.gmail.com>
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Fri, 9 Jan 2026 12:41:07 -0800
X-Gm-Features: AZwV_Qh6Gca2q8cBDwfG4Zl54AnO5eHMEPHL-qw8ARyTQOHUjVKrl7UjWTjSTY4
Message-ID: <CACSVV00iiAXGOqV2HZs9KREoqatE0eNBZjFH9hSFMmNaX3_RXw@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] Retrieve information about DDR from SMEM
To: Connor Abbott <cwabbott0@gmail.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Sean Paul <sean@poorly.run>, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDE2MiBTYWx0ZWRfX/0z/G9Gxc2so
 kWYljdQKgOmYbgkdV4ihqB13bmqAqbPJoDaBbTBNJ+o2NyiNJRbWJ6C0vzS/hcP9OfCgTAC/ihq
 5SA6baIslvB6RvMupgtewflDBrzxZTda+VUCjRvu3Q3XNIzldEacwt3qVWHTWpkDTIQj9J/8cHR
 epEcotS9LjwjGBCg4OP79boy+kStFQAnZGUIYuiza/95TDhP+wpdr/0PaogjAtBB84+Ai+/6viG
 puYlYNQF2fp6pUTFwRvtUL7A/wdvbMYBvT4ugX5v3a5oHWgAnLv7MtvetJhV5OfaCMrm3AuY0BQ
 LH4fpsQ09xtNCPbnLzmqCtWbiEv6xMG0PtaGtC0S78jp4+AlCw8AH2OjfQSw8jAXE5hsvsGTtWH
 9Ia2fhzwCsVGAU5TifjV3YGUZ6gQnBYjpTAz8AQLbgucX2L5x+ZNvi0Uw/kAxLvtGFVGmEU5avq
 +V53YFolz5h2CZ1NdUg==
X-Proofpoint-GUID: JTpQzz4vPNAVNkrfXWWK3u-Wc2WuNRZ-
X-Authority-Analysis: v=2.4 cv=IKUPywvG c=1 sm=1 tr=0 ts=696167ef cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=pGLkceISAAAA:8 a=I_tfjSbw-6LnIXkDKrAA:9 a=QEXdDO2ut3YA:10
 a=pF_qn-MSjDawc0seGVz6:22
X-Proofpoint-ORIG-GUID: JTpQzz4vPNAVNkrfXWWK3u-Wc2WuNRZ-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_06,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 suspectscore=0 bulkscore=0 phishscore=0
 adultscore=0 clxscore=1011 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601090162
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
Reply-To: rob.clark@oss.qualcomm.com
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Fri, Jan 9, 2026 at 11:11=E2=80=AFAM Connor Abbott <cwabbott0@gmail.com>=
 wrote:
>
> On Thu, Jan 8, 2026 at 9:22=E2=80=AFAM Konrad Dybcio <konradybcio@kernel.=
org> wrote:
> >
> > SMEM allows the OS to retrieve information about the DDR memory.
> > Among that information, is a semi-magic value called 'HBB', or Highest
> > Bank address Bit, which multimedia drivers (for hardware like Adreno
> > and MDSS) must retrieve in order to program the IP blocks correctly.
> >
> > This series introduces an API to retrieve that value, uses it in the
> > aforementioned programming sequences and exposes available DDR
> > frequencies in debugfs (to e.g. pass to aoss_qmp debugfs). More
> > information can be exposed in the future, as needed.
> >
> > Patch 3 should really be merged after 1&2
>
> No. The HBB value currently returned by the bootloader is *not* always
> the same as what we use currently, because some SoCs (like SM8250)
> with the same DT ship with multiple different DRAM configurations and
> we've been using a sub-optimal value the whole time. After all, that's
> the whole point of using the bootloader value. But patches 1&2 will
> only make the DPU use the bootloader value for HBB, not the GPU. So on
> one of the affected SoCs, it will introduce a mismatch. You can't
> change anything until the GPU side uses the new ubwc config as its
> source of truth.

Hmm, how is this even working today if DPU is using HBB from the
global table but GPU is not?  Are we just getting lucky with
compositors that don't know about modifiers and end up scanning out
linear?

We do log warnings when the global ubwc config does not match the
"fixed up" config.. google search for those msgs doesn't seem to turn
up anything other than the patch which introduced them.  Idk if that
is conclusive in any way, but I hope that means we could just delete
the fixup code on the GPU side.  I suppose we could add:

       *cfg =3D *common_cfg;

after the warning as a first step.  That would maybe get some bug
reports along with enough details in dmesg?

BR,
-R

> Connor
>
> >
> > Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > ---
> > Changes in v3:
> > - Support v6 and v7 DDRInfo (v7 is used on e.g. Hamoa)
> > - Handle rare cases of DDRInfo v5 with additional trailing data
> > - Rebase/adjust to SSoT UBWC
> > - Expose hbb value in debugfs
> > - cosmetic changes
> > - Link to v2: https://lore.kernel.org/r/20250410-topic-smem_dramc-v2-0-=
dead15264714@oss.qualcomm.com
> >
> > Changes in v2:
> > - Avoid checking for < 0 on unsigned types
> > - Overwrite Adreno UBWC data to keep the data shared with userspace
> >   coherent with what's programmed into the hardware
> > - Call get_hbb() in msm_mdss_enable() instead of all UBWC setup
> >   branches separately
> > - Pick up Bjorn's rb on patch 1
> > - Link to v1: https://lore.kernel.org/r/20250409-topic-smem_dramc-v1-0-=
94d505cd5593@oss.qualcomm.com
> >
> > ---
> > Konrad Dybcio (3):
> >       soc: qcom: smem: Expose DDR data from SMEM
> >       soc: qcom: ubwc: Get HBB from SMEM
> >       drm/msm/adreno: Trust the SSoT UBWC config
> >
> >  drivers/gpu/drm/msm/adreno/a5xx_gpu.c   |  11 +-
> >  drivers/gpu/drm/msm/adreno/a6xx_gpu.c   |  82 +------
> >  drivers/gpu/drm/msm/adreno/adreno_gpu.h |   5 -
> >  drivers/soc/qcom/Makefile               |   3 +-
> >  drivers/soc/qcom/smem.c                 |  14 +-
> >  drivers/soc/qcom/smem.h                 |   9 +
> >  drivers/soc/qcom/smem_dramc.c           | 408 ++++++++++++++++++++++++=
++++++++
> >  drivers/soc/qcom/ubwc_config.c          |  69 ++++--
> >  include/linux/soc/qcom/smem.h           |   4 +
> >  9 files changed, 485 insertions(+), 120 deletions(-)
> > ---
> > base-commit: fc4e91c639c0af93d63c3d5bc0ee45515dd7504a
> > change-id: 20250409-topic-smem_dramc-6467187ac865
> >
> > Best regards,
> > --
> > Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >
