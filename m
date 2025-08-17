Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64027B29391
	for <lists+freedreno@lfdr.de>; Sun, 17 Aug 2025 16:44:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FD0A10E11B;
	Sun, 17 Aug 2025 14:44:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="WYLRyYJf";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67DBD10E11B
 for <freedreno@lists.freedesktop.org>; Sun, 17 Aug 2025 14:43:58 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57HENhrf021072
 for <freedreno@lists.freedesktop.org>; Sun, 17 Aug 2025 14:43:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:reply-to:subject:to; s=
 qcppdkim1; bh=mG+T9ioMHhpoCcn/9XccD1BhBmq0p9hKB6K8Qj/BJqM=; b=WY
 LRyYJfUyboIDLBmXgXmK3V093KoKPRUAjgTKsm0T4HD96UoxuRoH407Mzv69H68I
 +/X6HXBNVtTgoOMWcnrbxPJv6behmKsBpgbyj6x+hn3FfDYFH7YMtV5rWzPvVHhc
 ZEi5fWJTkTWf33CQnocQ62jYqWChMsEdSfW4jmAcYM1VY7X4qG89WWZj0tvSRUeb
 qJJzzBnmrY+fVVbJm9pSJ/MCggGgz+WSqn2oMHo36YcrZwG91inwK7BRUv8VcCLg
 3TsSALJA0at46jQBU8IHVoclO7Pmp5AyPWpTiGrPuDqRX003YW1G8VjIgoglyb6O
 BUbRCoDvoWdy4XCoXEOw==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jj7426cu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sun, 17 Aug 2025 14:43:57 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id
 5614622812f47-435de8296d5so5804135b6e.3
 for <freedreno@lists.freedesktop.org>; Sun, 17 Aug 2025 07:43:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755441836; x=1756046636;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mG+T9ioMHhpoCcn/9XccD1BhBmq0p9hKB6K8Qj/BJqM=;
 b=IrqcPVICyX0EiDEriCgRIbtntrM7j0Ii/5zdNgF3ta47yufkYnWhE+92Q/SCriIqKl
 C3CRZPY1T9HdRVEVRGFe2VrH0aHinHWy/5V23HfkRT7U6RAqkyMxppUQbZ1jGcG1cm0K
 q7U8+MUNPu4hi196U9/hlXkkLq1AQyGnN/8BiLPwR5LbEBBt3LRE6vw9y7XsVHPQ5/f2
 tZk0vI66IMIUVJstqtlJSTX/DIzHMbAjE+4P+GADqZPzU08p8q69fi/ntl9xMP5cfCSb
 o0j+FvhPGkRgx8mAoUTi8qSf4lflFQnTp558rJnNwnv22WNg/WaLKiPUO3TkNjRc0obL
 HNpQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXFKGhEEqbN3X3zQcGOGKqjFG3lMkXBfdt72Z9psH6QxAAXtJpKGYaCy8+FcEWKPRiKfoX+dkiGemg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzOwU0q+NBI/JxY6LVrWhTVgOF0PyhH1YtpIrQMAlDuOiNTLOU4
 ppkFtfbk2yNmmN/CM0GVVKWqfqoJD2KFa1i8EbXxVjwSsck+UUsJAJP8gmWWajVUT79dTcfXz9c
 HOuRBRYvlll/VjEkStC9wEa+gBo9j3M2p2KiXOoDq1vS+xk3KG+yYg1FRtSrOXA0mjWrSWr6afY
 Skfbf41I0xWX7Pvj2jCCqAn4kk60I4tywBGQVJKAtb2LBmhA==
X-Gm-Gg: ASbGncuDEy8FF8HMWgSXExmHm7ZzrehqI9o4L672EW1EdJTTjePRqT+XaS/v+1YBDM6
 n55q5hLkYcYqWOmm2bfsKJcNxDxAK2l01PQ4EDxcAo0bbThb+yE1/1huOvxZ/1S/HWBL2g/PhsY
 kdkMclhO1UpG1IfoUzmebDRviCrRd33GLUwx6Iux/Y+Pzcu9kn0SWz
X-Received: by 2002:a05:6808:190d:b0:435:8516:343e with SMTP id
 5614622812f47-435ec3cdf92mr4934031b6e.8.1755441836553; 
 Sun, 17 Aug 2025 07:43:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFUkSCqKu1FMmtaCkSAOjjSEAlkF0asPnqBI3LUqti5JAzUxffF+Jw+/TKYdskWLAqj7nUf2y4Z3UOZBgeOrxo=
X-Received: by 2002:a05:6808:190d:b0:435:8516:343e with SMTP id
 5614622812f47-435ec3cdf92mr4934026b6e.8.1755441836116; Sun, 17 Aug 2025
 07:43:56 -0700 (PDT)
MIME-Version: 1.0
References: <20250720214458.22193-1-mcanal@igalia.com>
 <b2dcdd42-7547-47f3-a2f6-5de1f8f26f70@igalia.com>
In-Reply-To: <b2dcdd42-7547-47f3-a2f6-5de1f8f26f70@igalia.com>
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Sun, 17 Aug 2025 07:43:45 -0700
X-Gm-Features: Ac12FXxBU22nwFLJC3N9GBviLWCGGcAHNd5VHad9_3XTV7uXsMcKTWXJj9I3wSA
Message-ID: <CACSVV01+eB=E60zGnJTgxO0FaYf0XD7EjP+75T3VdGiQCys6Sw@mail.gmail.com>
Subject: Re: [PATCH v2] drm/msm: Update global fault counter when faulty
 process has already ended
To: =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>
Cc: Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 kernel-dev@igalia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: xM8vk2aSJGBbfkyT9Bs-Jjn1T3Ts1NOW
X-Proofpoint-ORIG-GUID: xM8vk2aSJGBbfkyT9Bs-Jjn1T3Ts1NOW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAzMyBTYWx0ZWRfX4HQjPA8pKjNT
 nrH3DQ8NvPlrT/QsZv/j65i6TB9eYPRtsHN0d/dChYD+YCP0/cjH/6i2HvHCXjQJnoHsP91uH5F
 hxEM0BtScNk5dzMXaH78IGnkbLR73fAiqLY+fYPF6Ym27L+aPYQZuivNcK5SB7XZJXFoPqZ53i5
 NhdGHcQcl1HewqlN5pdD57giNKuZM6ZnVsx4kqtCrUl3rIlHgnTiiVjhFhGt4EazIerPyawj/py
 twtvnozn/im1sE16JgdBLodUwqtu/XT/d5U6i3PXcjccXYoNGzyfjx5IjofR/nLF5P5hLWWvaXf
 7s9+ytLWiU4SSS3+2gT2+ackCSQL2eh+t+2zyMZTJR+//8k30wESu+BogmIhsE3uc1SbrUA+sGA
 vZJdBMQ8
X-Authority-Analysis: v=2.4 cv=MJtgmNZl c=1 sm=1 tr=0 ts=68a1eaad cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10
 a=VwQbUJbxAAAA:8 a=V2sgnzSHAAAA:8 a=M6jbYL6llvOW2sZO-FMA:9 a=QEXdDO2ut3YA:10
 a=_Y9Zt4tPzoBS9L09Snn2:22 a=Z31ocT7rh6aUJxSkT1EX:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-17_06,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0 suspectscore=0
 phishscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508160033
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

The patch is in msm-fixes, but I was out last week so haven't had a
chance to send a PR yet

thx

BR,
-R

On Fri, Aug 15, 2025 at 1:10=E2=80=AFPM Ma=C3=ADra Canal <mcanal@igalia.com=
> wrote:
>
> Hi,
>
> Gentle ping on this patch.
>
> Best Regards,
> - Ma=C3=ADra
>
> On 7/20/25 18:42, Ma=C3=ADra Canal wrote:
> > The global fault counter is no longer used since commit 12578c075f89
> > ("drm/msm/gpu: Skip retired submits in recover worker"). However, it's
> > still needed, as we need to handle cases where a GPU fault occurs after
> > the faulting process has already ended.
> >
> > Hence, increment the global fault counter when the submitting process
> > had already ended. This way, the number of faults returned by
> > MSM_PARAM_FAULTS will stay consistent.
> >
> > While here, s/unusuable/unusable.
> >
> > Fixes: 12578c075f89 ("drm/msm/gpu: Skip retired submits in recover work=
er")
> > Signed-off-by: Ma=C3=ADra Canal <mcanal@igalia.com>
> > ---
> >
> > v1 -> v2: https://lore.kernel.org/dri-devel/20250714230813.46279-1-mcan=
al@igalia.com/T/
> >
> > * Don't delete the global fault, but instead, increment it when the we =
get
> >       a fault after the faulting process has ended (Rob Clark)
> > * Rewrite the commit message based on the changes.
> >
> >   drivers/gpu/drm/msm/msm_gpu.c | 11 ++++++++---
> >   1 file changed, 8 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gp=
u.c
> > index c317b25a8162..416d47185ef0 100644
> > --- a/drivers/gpu/drm/msm/msm_gpu.c
> > +++ b/drivers/gpu/drm/msm/msm_gpu.c
> > @@ -465,6 +465,7 @@ static void recover_worker(struct kthread_work *wor=
k)
> >       struct msm_gem_submit *submit;
> >       struct msm_ringbuffer *cur_ring =3D gpu->funcs->active_ring(gpu);
> >       char *comm =3D NULL, *cmd =3D NULL;
> > +     struct task_struct *task;
> >       int i;
> >
> >       mutex_lock(&gpu->lock);
> > @@ -482,16 +483,20 @@ static void recover_worker(struct kthread_work *w=
ork)
> >
> >       /* Increment the fault counts */
> >       submit->queue->faults++;
> > -     if (submit->vm) {
> > +
> > +     task =3D get_pid_task(submit->pid, PIDTYPE_PID);
> > +     if (!task)
> > +             gpu->global_faults++;
> > +     else {
> >               struct msm_gem_vm *vm =3D to_msm_vm(submit->vm);
> >
> >               vm->faults++;
> >
> >               /*
> >                * If userspace has opted-in to VM_BIND (and therefore us=
erspace
> > -              * management of the VM), faults mark the VM as unusuable=
.  This
> > +              * management of the VM), faults mark the VM as unusable.=
 This
> >                * matches vulkan expectations (vulkan is the main target=
 for
> > -              * VM_BIND)
> > +              * VM_BIND).
> >                */
> >               if (!vm->managed)
> >                       msm_gem_vm_unusable(submit->vm);
>
