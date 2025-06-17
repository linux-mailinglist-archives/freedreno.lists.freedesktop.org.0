Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E37A3ADCDB7
	for <lists+freedreno@lfdr.de>; Tue, 17 Jun 2025 15:43:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB34710E6F4;
	Tue, 17 Jun 2025 13:43:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="bas43Ag8";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA51B10E6F4
 for <freedreno@lists.freedesktop.org>; Tue, 17 Jun 2025 13:43:34 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55HDOP0D022895
 for <freedreno@lists.freedesktop.org>; Tue, 17 Jun 2025 13:43:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:reply-to:subject:to; s=
 qcppdkim1; bh=89iVzQKlOZSzEW5QJvWpp5Nf+zKhS4IZciCVta9tSNE=; b=ba
 s43Ag8rW2mElnPIoWtolXBypKLasVLH5B4YiajQexHTf0svrxXX0o+zXfoXCqIBr
 UwHap4XoAz6TogD1aEV3PaP78n6uZydzEyqaJVwsmNUCVSazV2RxsK1LG39mwlUH
 2hcBwVLfnOpPQYRU0Yk8Qd/a7qAl/MCvuN9mmoJfrS3S5+KeHbJbHTN1jM1TzvG7
 7XZNSUj72DHMu+5ky7xn7krtQnU8WaL/OnoZsO50yruOB7JJNFJJ1zVsRwyEV/o1
 Aq0r1dYxqSYvNbhVjUi/AEi3ZDmYdWQ7zQLmr7NXrNWBj10ZZwPqU62V1Eu4f2la
 wbtpcN6MFvh3Z4OqxkkQ==
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com
 [209.85.161.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791hd0jhq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 17 Jun 2025 13:43:34 +0000 (GMT)
Received: by mail-oo1-f71.google.com with SMTP id
 006d021491bc7-60beffc65e2so4190325eaf.1
 for <freedreno@lists.freedesktop.org>; Tue, 17 Jun 2025 06:43:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750167813; x=1750772613;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=89iVzQKlOZSzEW5QJvWpp5Nf+zKhS4IZciCVta9tSNE=;
 b=vri4Xig+/u9Y7Is7aFpz8cMaZUXVEfBoJmD93ByJryYvHojDl7j5flRbb+c6KfA3IE
 DSPBZxLlwQxnj0T9tapHMoS6e9jUmZlDTy8vM5gg4HW+XZ462c3z0+C7m/Q+ApjDaJD6
 FQVPiDp8527vVhAj0F4cmlYSZIwUctjF9bwaMMgDmpe/OBdF5XFGizZ0zUzBmnqjLWwp
 Yak/nzUD1MnjcZGvyYqJx4RJ7FgKa2dzpWh/OlMSJlmJwiZdR7U1VmH7l1IUgU9VkkAd
 vXoV25PCDPJLYkxpPBEXqSRGf8YO0yj6Gggzc2qGV1Rz76Kk2t5um97IlRq7fnLjfbBV
 kH6g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVr6IhNoFVdiXAIRSU/V3OWYxMTOn/s4wxVuexysDGaXkHnDDSneJ+DCQXlVkhGJCp5AbMcvEjxJUA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzWRlAvRp3xd14vd8rK3HZoXAWRTUkE0Xpnr/Zm5TWr/diU6nJb
 7wBUVdDsFzycIRke70RJ6AwE4DAV0EG5SyUCtBcFPbsUAGJ9J/DjuQ0EBBT8kJ2BChcEof4Ko0X
 7AQxtgeV80Vf0vp5Fwu0O+ycML+vihB0PhLZIFA08AUI/S7zEG0Wu00MH7+u4an/gFa42+pI+C1
 x3G3pxq/9fECU7spCen24IgQpSrG/P+6pWENhsxs3VnjScdw==
X-Gm-Gg: ASbGncsvbu6DIPyD87otRcaJ37K9Eiiz74Y29e8QJKln6NRHugJfhQicjwBv7js72zU
 2oxMteVFlEQSvKGUhIZYdWmhkzPNalWedidRNhjYEw3fXdLOY/ewc8jQPV7Kwdm4CAn8iwRWw/X
 mOJGA7mFDfhGy0PpLEQb1PNN9FMgNBYaJ0mZw=
X-Received: by 2002:a05:6870:55d1:b0:2e8:755d:b4e9 with SMTP id
 586e51a60fabf-2eaf0713decmr7772109fac.1.1750167813043; 
 Tue, 17 Jun 2025 06:43:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFhDJZimhXQKcNIsXL5L6BmeP7ICuKtSU3Jxm1tzONbFrkSvIPcVUF/XXyIKFzo5An/dyyhPKUafantFxuovG8=
X-Received: by 2002:a05:6870:55d1:b0:2e8:755d:b4e9 with SMTP id
 586e51a60fabf-2eaf0713decmr7772090fac.1.1750167812615; Tue, 17 Jun 2025
 06:43:32 -0700 (PDT)
MIME-Version: 1.0
References: <20250613235705.28006-1-robin.clark@oss.qualcomm.com>
 <20250613235705.28006-3-robin.clark@oss.qualcomm.com>
 <aE1RPZ_-oFyM4COy@pollux>
 <CACSVV00uwmuAC4eMi-4QiF4sOu4r9u8eXxyAgt83YS8Yfgoemg@mail.gmail.com>
 <aFCO7_RHuAaGyq1Q@pollux>
 <CACSVV03WboQp_A1bzQ+xpX5DDkfaoXmbTuo9RfZ9bMaVTqdU+A@mail.gmail.com>
 <aFE6pq8l33NXfFdT@pollux>
 <CACSVV00VzOfTDh2sKst+POzkZ-5MH+0BDY-GVB2WKTyONRrHjw@mail.gmail.com>
In-Reply-To: <CACSVV00VzOfTDh2sKst+POzkZ-5MH+0BDY-GVB2WKTyONRrHjw@mail.gmail.com>
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Tue, 17 Jun 2025 06:43:21 -0700
X-Gm-Features: AX0GCFvUN5Vtw6q9IQOQDEBExOpLuP6bjoq_1cf32Yhb7iLKA8phUQzitd1kxgQ
Message-ID: <CACSVV00cng4PzHzqydGw_L34_f+6KiZTyCRdggNfHaDePGzFOA@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/gpuvm: Add locking helpers
To: Danilo Krummrich <dakr@redhat.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE3MDEwNyBTYWx0ZWRfX4h6R3jc06M7r
 Ta0fUEWtjkMtO/MHe56sdbMtthlbH7NEDQneIqw5waHvgFbCbUXgA5gf8a34Ru8Myq1sW9shGOw
 rteMIeLAfopdcz0Dndc5sKiv1HB0E/2Aks25m3I9PD6kbRAV+NXEhSdXuQX1DJK6qUYpstL0kak
 SLo4RPYEcq3Wp8okSjuMbWpH0Z9p7T3bnEhvlWHiCTFFJEnXg+GjmsM+kGP4uGgA0C/cvJWCyJz
 sH2u8AyWp8oBVWletNlnahJzSyQ4mW/UUjxJZJKvfy4liC/bwX1sBKiNjnr8wocFo2fS5P8L41/
 LN1DsehFrAYzNm7Sroe0Litc3sxfAnJ8nnwMNqcbMUWE7/EsgTIfrQQWYKILoikELeeBk2EuXHg
 ooF/V3WpqHbKm35OHP7SOXXnhdNbMUqdhyTPK9Gtb5Mm0AYO4SlsZSILM/xvBCYz+m+oLWSL
X-Authority-Analysis: v=2.4 cv=PtaTbxM3 c=1 sm=1 tr=0 ts=68517106 cx=c_pps
 a=V4L7fE8DliODT/OoDI2WOg==:117 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10
 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=20KFwNOVAAAA:8 a=AMTndSw0vTCt-rItpBEA:9
 a=QEXdDO2ut3YA:10 a=WZGXeFmKUf7gPmL3hEjn:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: TZV_CSiNKqx7vZgtueyRPO04Iy1QN9QK
X-Proofpoint-GUID: TZV_CSiNKqx7vZgtueyRPO04Iy1QN9QK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-17_06,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 mlxlogscore=999 suspectscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 spamscore=0
 priorityscore=1501 phishscore=0 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506170107
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

On Tue, Jun 17, 2025 at 5:48=E2=80=AFAM Rob Clark <rob.clark@oss.qualcomm.c=
om> wrote:
>
> On Tue, Jun 17, 2025 at 2:51=E2=80=AFAM Danilo Krummrich <dakr@redhat.com=
> wrote:
> >
> > On Mon, Jun 16, 2025 at 03:25:08PM -0700, Rob Clark wrote:
> > > On Mon, Jun 16, 2025 at 2:39=E2=80=AFPM Danilo Krummrich <dakr@redhat=
.com> wrote:
> > > >
> > > > On Sat, Jun 14, 2025 at 08:03:20AM -0700, Rob Clark wrote:
> > > > > On Sat, Jun 14, 2025 at 3:39=E2=80=AFAM Danilo Krummrich <dakr@re=
dhat.com> wrote:
> > > > > >
> > > > > > On Fri, Jun 13, 2025 at 04:57:03PM -0700, Rob Clark wrote:
> > > > > > > For UNMAP/REMAP steps we could be needing to lock objects tha=
t are not
> > > > > > > explicitly listed in the VM_BIND ioctl in order to tear-down =
unmapped
> > > > > > > VAs.  These helpers handle locking/preparing the needed objec=
ts.
> > > > > >
> > > > > > Yes, that's a common use-case. I think drivers typically iterat=
e through their
> > > > > > drm_gpuva_ops to lock those objects.
> > > > > >
> > > > > > I had a look at you link [1] and it seems that you keep a list =
of ops as well by
> > > > > > calling vm_op_enqueue() with a new struct msm_vm_op from the ca=
llbacks.
> > > > > >
> > > > > > Please note that for exactly this case there is the op_alloc ca=
llback in
> > > > > > struct drm_gpuvm_ops, such that you can allocate a custom op ty=
pe (i.e. struct
> > > > > > msm_vm_op) that embedds a struct drm_gpuva_op.
> > > > >
> > > > > I did use drm_gpuvm_sm_xyz_ops_create() in an earlier iteration o=
f my
> > > > > VM_BIND series, but it wasn't quite what I was after.  I wanted t=
o
> > > > > apply the VM updates immediately to avoid issues with a later
> > > > > map/unmap overlapping an earlier map, which
> > > > > drm_gpuvm_sm_xyz_ops_create() doesn't really handle.  I'm not eve=
n
> > > > > sure why this isn't a problem for other drivers unless userspace =
is
> > > > > providing some guarantees.
> > > >
> > > > The drm_gpuva_ops are usually used in a pattern like this.
> > > >
> > > >         vm_bind {
> > > >                 for_each_vm_bind_operation {
> >                             drm_gpuvm_sm_xyz_ops_create();
> > > >                         drm_gpuva_for_each_op {
> > > >                                 // modify drm_gpuvm's interval tree
> > > >                                 // pre-allocate memory
> > > >                                 // lock and prepare objects
> > > >                         }
> > > >                 }
> > > >
> > > >                 drm_sched_entity_push_job();
> > > >         }
> > > >
> > > >         run_job {
> > > >                 for_each_vm_bind_operation {
> > > >                         drm_gpuva_for_each_op {
> > > >                                 // modify page tables
> > > >                         }
> > > >                 }
> > > >         }
> > > >
> > > >         run_job {
> > > >                 for_each_vm_bind_operation {
> > > >                         drm_gpuva_for_each_op {
> > > >                                 // free page table structures, if a=
ny
> > > >                                 // free unused pre-allocated memory
> > > >                         }
> > > >                 }
> > > >         }
> > > >
> > > > What did you do instead to get map/unmap overlapping? Even more int=
eresting,
> > > > what are you doing now?
> > >
> > > From what I can tell, the drivers using drm_gpva_for_each_op()/etc ar=
e
> > > doing drm_gpuva_remove() while iterating the ops list..
> > > drm_gpuvm_sm_xyz_ops_create() itself does not modify the VM.  So this
> > > can only really work if you perform one MAP or UNMAP at a time.  Or a=
t
> > > least if you process the VM modifying part of the ops list before
> > > proceeding to the next op.
> >
> > (Added the drm_gpuvm_sm_xyz_ops_create() step above.)
> >
> > I went through the code you posted [1] and conceptually you're implemen=
ting
> > exactly the pattern I described above, i.e. you do:
> >
> >         vm_bind {
> >                 for_each_vm_bind_operation {
> >                         drm_gpuvm_sm_xyz_exec_lock();
> >                 }
> >
> >                 for_each_vm_bind_operation {
> >                         drm_gpuvm_sm_xyz() {
> >                                 // modify drm_gpuvm's interval tree
> >                                 // create custom ops
> >                         }
> >                 }
> >
> >                 drm_sched_entity_push_job();
> >         }
> >
> >         run_job {
> >                 for_each_vm_bind_operation {
> >                         for_each_custom_op() {
> >                                 // do stuff
> >                         }
> >                 }
> >         }
>
> Close, but by the time we get to run_job there is just a single list
> of ops covering all the vm_bind operations:
>
>         run_job {
>                 for_each_custom_op() {
>                         // do stuff
>                 }
>         }
>
> rather than a list of va ops per vm_bind op.
>
> > However, GPUVM intends to solve your use-case with the following, seman=
tically
> > identical, approach.
> >
> >         vm_bind {
> >                 for_each_vm_bind_operation {
> >                         drm_gpuvm_sm_xyz_ops_create();
> >
> >                         drm_gpuva_for_each_op {
> >                                 // modify drm_gpuvm's interval tree
> >                                 // lock and prepare objects (1)
>
> I currently decouple lock+pin from VM modification to avoid an error
> path that leaves the VM partially modified.  Once you add this back
> in, the va-ops approach isn't simpler, IMHO.

Oh, actually scratch that.. using va-ops, it is not even possible to
decouple locking/prepare from VM modifications.  So using
DRM_EXEC_INTERRUPTIBLE_WAIT, for ex, with va-ops list would be an
actively bad idea.

BR,
-R

> >                         }
> >                 }
> >
> >                 drm_sched_entity_push_job();
> >         }
> >
> >         run_job {
> >                 for_each_vm_bind_operation {
> >                         drm_gpuva_for_each_op() {
> >                                 // do stuff
> >                         }
> >                 }
> >         }
> >
> > (Note that GPUVM already supports to extend the existing OP structures;=
 you
> > should take advantage of that.)
> >
> > Hence, the helper we really want is to lock and prepare the objects at =
(1). I.e.
> > a helper that takes a pointer to a struct drm_gpuva_op and locks / vali=
dates the
> > corresponding objects.
>
> I still prefer that we don't _require_ using va-ops.  But if it makes
> it more useful for other drivers I could add a helper which
> exec_lock's based on a list of va-ops instead.
>
> BR,
> -R
>
> > [1] https://gitlab.freedesktop.org/robclark/msm/-/blob/sparse-newer/dri=
vers/gpu/drm/msm/msm_gem_vma.c
> >
