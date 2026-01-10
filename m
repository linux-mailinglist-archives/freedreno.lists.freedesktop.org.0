Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DD88D0CF06
	for <lists+freedreno@lfdr.de>; Sat, 10 Jan 2026 05:18:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E31D10E21D;
	Sat, 10 Jan 2026 04:18:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="BfekGxZY";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R1A/C3nL";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F95010E21D
 for <freedreno@lists.freedesktop.org>; Sat, 10 Jan 2026 04:18:07 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60A0gsCl2507036
 for <freedreno@lists.freedesktop.org>; Sat, 10 Jan 2026 04:18:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:reply-to:subject:to; s=
 qcppdkim1; bh=YvjR0sBl390qKfGTGwTn1b7N4BohJDG5WI0+S6lfGO0=; b=Bf
 ekGxZYZrvAfw6lK8Y4gHqENufiUBXfU3wkG7ro068gB6oDimVe10D6URbkdZ35cw
 o/Z/Sfe9HKU2EqyccdEWiZu1Vhbw8nQyuCXuko0G8kZld4nuFBIxBo/mOBcdPnWo
 dQoTBAtSOiSwZS3qs2mMm3sBkirrj4RkiKJ2Ha8KvElBXENGufDQkIzgvdufPc03
 0cygvwlLV8VpZHHuUMSqzoCQUq6JOm61jMRuNdphO4ZqKH6lh4FQVrj95PqKN0d+
 M+Dp733rW7Pch3HbOn1GIffgkx7c2DyaxmyMoGi6ya2DwipG8TcpnhCeP84jNxaE
 ZFDjQhFH33HI03eRlLBA==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bkcfbra77-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sat, 10 Jan 2026 04:18:06 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id
 5614622812f47-4557c1e9e54so10231633b6e.1
 for <freedreno@lists.freedesktop.org>; Fri, 09 Jan 2026 20:18:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768018685; x=1768623485;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=YvjR0sBl390qKfGTGwTn1b7N4BohJDG5WI0+S6lfGO0=;
 b=R1A/C3nLkpGr9Ue3v0qiykEygxjyoIMt3vML1+RUSNVpz0uVBOjKtZ7BEeXL8tvHf9
 o7v1xCIU/pII8I+fUIUArCi8Fq1jL3P07mftgPNGMyDkfj0ShWIbuVWAqHBUd3urYo14
 s/QNc0hocwuykKYCfWfmmdYK004U4+ZeB2+ZB51a59GSnjlDVH28Do3Hw/NNp836AiI+
 YsVzML+cgTua+lYe20HLNW9NMUROYrR6h5pK18VQshEHKnYhjL9wajg62Zh8n8JusN/R
 2Hl46OttO6dEEv13CQFJCWFpiSIPmP9dCLZzStc6kdd7hRFITeh2Oi//2HWbtkNiI+0G
 P3kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768018685; x=1768623485;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YvjR0sBl390qKfGTGwTn1b7N4BohJDG5WI0+S6lfGO0=;
 b=OCqrtWGBp0QV4Dtml/GgX7Ze68oYBPhkoEu3rEcp1Mjgjb0T6kxpcRqGdtW0w6KdLg
 FvPtgtSFWSbEaQSzgXm5UTArmVE0kjC4RoSi4B57t4t8rWjz2PvXTZ2Ueh5IlgQtKeVk
 U7jqg83ZxoY4Ni/LBsxfkqbTanBLiKofJsc+LfG1YysEPYlyHU8B308AcjtG4BQrlaUV
 05OMKV8cAXBoVnsRWhCzetD3Z23GFQ2EGczwB/QD3E7OcIxTn08V+6bgtiKJ/xVdJdRz
 porzot9t68Z8RuFYBl+O1IJxf3Nt7ZCp4hCDy+WzKR/3hAjxcBK6zpocuH8VtGLbGfO/
 SdWg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWd1zgLWOfzkEF8gl0FfUfXxeAF5Asg22a2JOE0LfNvG5+5xFqdBVaRLdSZNKtSqmtvAx1ENh5o9Ls=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwawAmp2T4+xc7y8eA+7GDCil3nYQXAF9KxxoMAPuL+PXEaGX5/
 3UMUcYUb59Y3yfdIrFO3hCA/M8+GBSUrgDVxIbf9215Ep3QBaQwf3sdcnSTYApKw8HMYisCzquy
 qatoc3eZVHMpgNMURX/JwD08JOF2MzZRoOcACtjlYGKNstul/m3ysYfd6Cz4rjpPLzjgkyZMOnI
 5Fkm0UCQmMnjqHkUteVl22jA85kWVKGhMaP1BBU/4GToI9iA==
X-Gm-Gg: AY/fxX7dU2gwIw7FWHt/aqbM0OvJ0ZT3nKbCoJc++sI+FYTz7ROryNJwU5+qHMxmBfQ
 yRBaKY4h0v6+h8P4IVkVrM8tY0E/lFWkwrEb/zLpKf8BDRzDiqXT23QdqFAVvNiw/CcYbXmhs6k
 203sA0vabeH8uluwFOVWhT8++kmYB29eptH05/BRd1Bi9yimiOEdWKuqvMyMIVwTlpSg==
X-Received: by 2002:a05:6808:2215:b0:44f:6ab9:4aee with SMTP id
 5614622812f47-45a6befaaeemr6297668b6e.63.1768018685324; 
 Fri, 09 Jan 2026 20:18:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEymw+xBhx5CKa9dPjA1bNNpF9wJib+zhE+Ki6h1wPxpj6SjAHb+30fr/sZ4jiXlFDFMlOvN+MlaY3wAHuPd3g=
X-Received: by 2002:a05:6808:2215:b0:44f:6ab9:4aee with SMTP id
 5614622812f47-45a6befaaeemr6297655b6e.63.1768018684906; Fri, 09 Jan 2026
 20:18:04 -0800 (PST)
MIME-Version: 1.0
References: <20260108-topic-smem_dramc-v3-0-6b64df58a017@oss.qualcomm.com>
 <CACu1E7EDmLPhUFyouD=W6n+U7=oo7+6PY0Gz9=3pVpT2Qu9Z6w@mail.gmail.com>
 <CACSVV00iiAXGOqV2HZs9KREoqatE0eNBZjFH9hSFMmNaX3_RXw@mail.gmail.com>
 <CACu1E7Fh=GbLTiedj6OqtUxWiZbCVcKmsEzV6FYan5G6r1uyUA@mail.gmail.com>
In-Reply-To: <CACu1E7Fh=GbLTiedj6OqtUxWiZbCVcKmsEzV6FYan5G6r1uyUA@mail.gmail.com>
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Fri, 9 Jan 2026 20:17:54 -0800
X-Gm-Features: AQt7F2pDX7FL2yQ5nEVGvdEQ4fegGKJEg02gjG594h0T2ZpR_q9rSVNBqJ-Mto8
Message-ID: <CACSVV015qwuGnJrMiZa=eKzu8BeGyGg5gpp=ko7-QgrAjE2phw@mail.gmail.com>
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
X-Authority-Analysis: v=2.4 cv=WO5yn3sR c=1 sm=1 tr=0 ts=6961d2fe cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=pGLkceISAAAA:8 a=KgOssdJzQp_kbXOIULcA:9 a=QEXdDO2ut3YA:10
 a=TPnrazJqx2CeVZ-ItzZ-:22
X-Proofpoint-ORIG-GUID: 3wXCmV8Eo37d8eHYMlPkvExLqhMjLHm4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEwMDAzMSBTYWx0ZWRfXzme19YMLv+Od
 nBvrrcWF4WR9+qVKs/u8idjiqBChG4p+ebYcRCKcwd41wWAYu1TK4nHH0YKe6qrbQlNom/mixzN
 dA3EoFwB7P5V7ULd7Te2JGKy/JGnq5zWaCH8PWCgfMw/9HKkdqL6UpULzgyzwdjEnITuUiWRkWB
 6wnzaITJ0SoxPHgiCRAZRy3WgNE89GYWCVXQ423njZfItBENar73hEmB4l0Z2ePQ5A4+yqHJpbd
 TthQhWtjbo6wH7fdsvZ7DKkGXyda66BtFp5ystorVIWPhon3LKelXxOG7pfCxomQAQmuTLCY5Z6
 927LrHE/k03JhoHAPUF4i1OCsLxbh/xtPzyEhTb/bqzQBH1lZgO2iHtVvhAFvYhDB2QzhehhoiN
 Rpw2OZR4yxdwD2WfPrVyEi9EiaMHKvMXGyomn4y4ZAC9eIVAgy1fkvuJaR9ViKeC9Y7H0FcXkcF
 NKI9C0wb7J8wrORCxVw==
X-Proofpoint-GUID: 3wXCmV8Eo37d8eHYMlPkvExLqhMjLHm4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-10_01,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 clxscore=1015 spamscore=0 phishscore=0 bulkscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601100031
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

On Fri, Jan 9, 2026 at 1:03=E2=80=AFPM Connor Abbott <cwabbott0@gmail.com> =
wrote:
>
> On Fri, Jan 9, 2026 at 3:41=E2=80=AFPM Rob Clark <rob.clark@oss.qualcomm.=
com> wrote:
> >
> > On Fri, Jan 9, 2026 at 11:11=E2=80=AFAM Connor Abbott <cwabbott0@gmail.=
com> wrote:
> > >
> > > On Thu, Jan 8, 2026 at 9:22=E2=80=AFAM Konrad Dybcio <konradybcio@ker=
nel.org> wrote:
> > > >
> > > > SMEM allows the OS to retrieve information about the DDR memory.
> > > > Among that information, is a semi-magic value called 'HBB', or High=
est
> > > > Bank address Bit, which multimedia drivers (for hardware like Adren=
o
> > > > and MDSS) must retrieve in order to program the IP blocks correctly=
.
> > > >
> > > > This series introduces an API to retrieve that value, uses it in th=
e
> > > > aforementioned programming sequences and exposes available DDR
> > > > frequencies in debugfs (to e.g. pass to aoss_qmp debugfs). More
> > > > information can be exposed in the future, as needed.
> > > >
> > > > Patch 3 should really be merged after 1&2
> > >
> > > No. The HBB value currently returned by the bootloader is *not* alway=
s
> > > the same as what we use currently, because some SoCs (like SM8250)
> > > with the same DT ship with multiple different DRAM configurations and
> > > we've been using a sub-optimal value the whole time. After all, that'=
s
> > > the whole point of using the bootloader value. But patches 1&2 will
> > > only make the DPU use the bootloader value for HBB, not the GPU. So o=
n
> > > one of the affected SoCs, it will introduce a mismatch. You can't
> > > change anything until the GPU side uses the new ubwc config as its
> > > source of truth.
> >
> > Hmm, how is this even working today if DPU is using HBB from the
> > global table but GPU is not?  Are we just getting lucky with
> > compositors that don't know about modifiers and end up scanning out
> > linear?
>
> It works out as well as it's always worked out, i.e. we try to make
> GPU and DPU config match and pray that we didn't mess it up. At least
> now we'll get a warning when they don't match.

I mean, upstream we kinda have a lack of feedback metrics other than
people reporting bugs... so maybe the first step is to break it with

  *cfg =3D *common_cfg;

and see what happens.

> >
> > We do log warnings when the global ubwc config does not match the
> > "fixed up" config.. google search for those msgs doesn't seem to turn
> > up anything other than the patch which introduced them.  Idk if that
> > is conclusive in any way, but I hope that means we could just delete
> > the fixup code on the GPU side.  I suppose we could add:
> >
> >        *cfg =3D *common_cfg;
> >
> > after the warning as a first step.  That would maybe get some bug
> > reports along with enough details in dmesg?
>
> Yes, the plan was always to delete the fixup code in the GPU config.
> And even that first step would be enough to prevent regressions when
> switching to the bootloader HBB value.
>
> There is a problem in that ubwc_swizzle isn't as well tested. Older
> parts supporting UBWC 1.0-3.0 partially or entirely ignore
> ubwc_swizzle, because it wasn't configurable back then, but we rely on
> it being set correctly in Mesa for VK_EXT_host_image_copy and sparse
> textures. So if ubwc_swizzle is incorrect you probably wouldn't
> notice, until you hit the HIC codepath in zink or some game using
> sparse textures. I think we fixed up all the cases where it was
> incorrectly set to 0x1 instead of 0x7, but it would be worth it to
> check again.

There are a lot more things out there than there are things running
games that would hit that.  Idk about zink, but there is a gallium
driver.  Either way, we don't have metrics feedback so the only option
is to break things with enough info in dmesg to figure out what is
going wrong AFAICT.

BR,
-R


>
> Connor
>
> >
> > BR,
> > -R
> >
> > > Connor
> > >
> > > >
> > > > Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > > > ---
> > > > Changes in v3:
> > > > - Support v6 and v7 DDRInfo (v7 is used on e.g. Hamoa)
> > > > - Handle rare cases of DDRInfo v5 with additional trailing data
> > > > - Rebase/adjust to SSoT UBWC
> > > > - Expose hbb value in debugfs
> > > > - cosmetic changes
> > > > - Link to v2: https://lore.kernel.org/r/20250410-topic-smem_dramc-v=
2-0-dead15264714@oss.qualcomm.com
> > > >
> > > > Changes in v2:
> > > > - Avoid checking for < 0 on unsigned types
> > > > - Overwrite Adreno UBWC data to keep the data shared with userspace
> > > >   coherent with what's programmed into the hardware
> > > > - Call get_hbb() in msm_mdss_enable() instead of all UBWC setup
> > > >   branches separately
> > > > - Pick up Bjorn's rb on patch 1
> > > > - Link to v1: https://lore.kernel.org/r/20250409-topic-smem_dramc-v=
1-0-94d505cd5593@oss.qualcomm.com
> > > >
> > > > ---
> > > > Konrad Dybcio (3):
> > > >       soc: qcom: smem: Expose DDR data from SMEM
> > > >       soc: qcom: ubwc: Get HBB from SMEM
> > > >       drm/msm/adreno: Trust the SSoT UBWC config
> > > >
> > > >  drivers/gpu/drm/msm/adreno/a5xx_gpu.c   |  11 +-
> > > >  drivers/gpu/drm/msm/adreno/a6xx_gpu.c   |  82 +------
> > > >  drivers/gpu/drm/msm/adreno/adreno_gpu.h |   5 -
> > > >  drivers/soc/qcom/Makefile               |   3 +-
> > > >  drivers/soc/qcom/smem.c                 |  14 +-
> > > >  drivers/soc/qcom/smem.h                 |   9 +
> > > >  drivers/soc/qcom/smem_dramc.c           | 408 ++++++++++++++++++++=
++++++++++++
> > > >  drivers/soc/qcom/ubwc_config.c          |  69 ++++--
> > > >  include/linux/soc/qcom/smem.h           |   4 +
> > > >  9 files changed, 485 insertions(+), 120 deletions(-)
> > > > ---
> > > > base-commit: fc4e91c639c0af93d63c3d5bc0ee45515dd7504a
> > > > change-id: 20250409-topic-smem_dramc-6467187ac865
> > > >
> > > > Best regards,
> > > > --
> > > > Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > > >
