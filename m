Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41714ADCBDA
	for <lists+freedreno@lfdr.de>; Tue, 17 Jun 2025 14:49:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C94010E3C5;
	Tue, 17 Jun 2025 12:49:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="TzbgZmve";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 098C110E3C5
 for <freedreno@lists.freedesktop.org>; Tue, 17 Jun 2025 12:49:05 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55H60j9r021215
 for <freedreno@lists.freedesktop.org>; Tue, 17 Jun 2025 12:49:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:reply-to:subject:to; s=
 qcppdkim1; bh=HsjtAPzi1ENatdMFvPbZQiDIcA+6y5YgY7lBmrMZq70=; b=Tz
 bgZmveOd9ZR3FCr//DrV1wJ5RbUDyeeS/1oVqfYTxGwKV1YNLgwrsDMidzxggcxT
 F+xsRKtD3jvaeIRmvXDYwyvaxzs1yRob0Jo1FerC1EX3iTLf74IV/e6oH3NiEOvS
 HRWcz9qOQdBQ2Nos83rJJB+iQWpC+tsZOwaDQL4/2PA8nb1iTajurisRrgl/pQtd
 5jnIL7esx+xD7c+pUMqTuafQ1TrHjpAVkckI2rmUHEq6jLfWc9RtWvy5M4z4N7D1
 rZf6CZHd9E5vTOnPInLyiJGEKUFZEjpnt2U4oVsXntJxeOlPFD/jgzo3X2hGLFn4
 289CCKKb+DQ2kU8o9lpg==
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com
 [209.85.160.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791h989jx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 17 Jun 2025 12:49:05 +0000 (GMT)
Received: by mail-oa1-f71.google.com with SMTP id
 586e51a60fabf-2d50f1673ddso4963820fac.3
 for <freedreno@lists.freedesktop.org>; Tue, 17 Jun 2025 05:49:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750164544; x=1750769344;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HsjtAPzi1ENatdMFvPbZQiDIcA+6y5YgY7lBmrMZq70=;
 b=W6KKtKI0u/xfKMcWYvQyOjn/cQfr9BFyZv4heqtxz7QhsCQ1OVn1sJnGln5nOg0zeY
 f4MY5yQwobnuNSF/uqpCucy89RhL2B0Gs2SUY8+hidqtCmp0usjazODdqkT6dsVrseuR
 GCKChciUgW8JLzVSh0k5OYn0yGcsx+gsr6gCHaTx8Xq+BzhsLGp+12ak4qmeaDEeRbnj
 Cpj0TM0779AV0W1N8BjJzAsWHkoj60eYZPd0ncJjCSHU12FwHOKUX4DWRmaaavh2hm1S
 IkAdAnPVpV8QjVFuL59bUPUQoL6OanRipT9zBZ4Bn6GotKfL5xbaarZFPgs5tlq/B3u/
 ED1w==
X-Forwarded-Encrypted: i=1;
 AJvYcCX+9VB2J+q9+XYXfqF0bbjxubPSZmc7hCRaLsCso7lOO90AWov2lRYe0eGWr7avGtsq+OrLgxO8l7U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw2A0J3MfI3RsxmOnPB0+Yk5BVSAITcHm+uX4WwxYtk8pDBIV+V
 GuMO1jA9l+oJhkhO8KUQTa48gfJJp/q7EP+wyuqNujR+ZouG8EX8SdR/4TgqDHXj3qEpN4ClZEI
 2MSccEBbRgubdjrobsdn8ZgN3Eya2cRBBE6FbZjSqYm9p6Ya9FErgtv7p8D7qyd7gGnwM4XIe28
 3flMPKLd4M0zpn7CxMoqyiJfupqLB6KP4IQldM3bHIJD4j2w==
X-Gm-Gg: ASbGnctxTXSPK8kPTLwWXGYOiRP+OQWC4kuI+LQl0eMiaOhm5aAJ6RLrgSRubSK1HD1
 NwIuzMC5yr+KpxP7z5hUh1xnK/bpW0x7Q20732uVmDeSJEfb+0FSNjjnwvH/I40Rnq2k3j2f0B7
 fCwQiDnrseKYeK7H51TZi2CMD4bCTCaVQEiqA=
X-Received: by 2002:a05:6871:808:b0:2c6:7f82:d38c with SMTP id
 586e51a60fabf-2eaf08f5e95mr7741569fac.31.1750164544096; 
 Tue, 17 Jun 2025 05:49:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFVcM/MQTWFafHIfMYka9uN1j4G7MdwAjNhpq/R3LYdd+ev5tTG9Q8+EdYKxyTexzb9k6Yr8QjEodNKm2RNHAk=
X-Received: by 2002:a05:6871:808:b0:2c6:7f82:d38c with SMTP id
 586e51a60fabf-2eaf08f5e95mr7741553fac.31.1750164543683; Tue, 17 Jun 2025
 05:49:03 -0700 (PDT)
MIME-Version: 1.0
References: <20250613235705.28006-1-robin.clark@oss.qualcomm.com>
 <20250613235705.28006-3-robin.clark@oss.qualcomm.com>
 <aE1RPZ_-oFyM4COy@pollux>
 <CACSVV00uwmuAC4eMi-4QiF4sOu4r9u8eXxyAgt83YS8Yfgoemg@mail.gmail.com>
 <aFCO7_RHuAaGyq1Q@pollux>
 <CACSVV03WboQp_A1bzQ+xpX5DDkfaoXmbTuo9RfZ9bMaVTqdU+A@mail.gmail.com>
 <aFE6pq8l33NXfFdT@pollux>
In-Reply-To: <aFE6pq8l33NXfFdT@pollux>
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Tue, 17 Jun 2025 05:48:52 -0700
X-Gm-Features: AX0GCFtPfTlA2GRsU9ACng3Ixka2Eu1d511bEmpGNDNZ-mVIdVL_VX43qMBCLHE
Message-ID: <CACSVV00VzOfTDh2sKst+POzkZ-5MH+0BDY-GVB2WKTyONRrHjw@mail.gmail.com>
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
X-Proofpoint-ORIG-GUID: Sh7PciMUPvwbV0lkz6NmC0nbqp-YvcqH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE3MDEwMSBTYWx0ZWRfX+cbPjER4ZGq4
 j8WqdX+wSZyiRtttleIFCQ2OAgAaAt5XIZM4K4mgfRketteiZppwei/wrpi3K7CiKmX1Y/vKpRC
 JtvI4Hws0mO8RQA/T/Ur5oLdEffekN6K6/uBlY/qTX1w/Bi01k7VWGdqiYuoLuoAJVjUmgHLkUU
 x6y5mmn/ygm1uBnXWdso/reZz2tC3M3BunjOeX/77oxO4cMH+EH+R6KlzvNM1TtRiQUzv1VRMSi
 cSimNMwCOxvoo+KwsciFI9XgLwgSqGOuTOc774iLm7QI3LzwkeFFql/h6qeBtWn3OqgxJvuOIUY
 I2MOKfshts9+qNOSAOpyYC3rgGQzk+s2//UpaDScD+4n/olPeKvhos3foQOMLgaXDRRizFzJAFS
 GsAgcuSyIfP9ak4Yup2ySw3BNnFVPgx2yFCYV5u52p2o/jSotCTqwNmGaPZl+M5O+e4BcpED
X-Authority-Analysis: v=2.4 cv=UL/dHDfy c=1 sm=1 tr=0 ts=68516441 cx=c_pps
 a=CWtnpBpaoqyeOyNyJ5EW7Q==:117 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10
 a=e5mUnYsNAAAA:8 a=20KFwNOVAAAA:8 a=hmUYbjr5NfTcrHOMeKgA:9 a=QEXdDO2ut3YA:10
 a=vh23qwtRXIYOdz9xvnmn:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: Sh7PciMUPvwbV0lkz6NmC0nbqp-YvcqH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-17_05,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 phishscore=0 mlxlogscore=999
 malwarescore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506170101
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

On Tue, Jun 17, 2025 at 2:51=E2=80=AFAM Danilo Krummrich <dakr@redhat.com> =
wrote:
>
> On Mon, Jun 16, 2025 at 03:25:08PM -0700, Rob Clark wrote:
> > On Mon, Jun 16, 2025 at 2:39=E2=80=AFPM Danilo Krummrich <dakr@redhat.c=
om> wrote:
> > >
> > > On Sat, Jun 14, 2025 at 08:03:20AM -0700, Rob Clark wrote:
> > > > On Sat, Jun 14, 2025 at 3:39=E2=80=AFAM Danilo Krummrich <dakr@redh=
at.com> wrote:
> > > > >
> > > > > On Fri, Jun 13, 2025 at 04:57:03PM -0700, Rob Clark wrote:
> > > > > > For UNMAP/REMAP steps we could be needing to lock objects that =
are not
> > > > > > explicitly listed in the VM_BIND ioctl in order to tear-down un=
mapped
> > > > > > VAs.  These helpers handle locking/preparing the needed objects=
.
> > > > >
> > > > > Yes, that's a common use-case. I think drivers typically iterate =
through their
> > > > > drm_gpuva_ops to lock those objects.
> > > > >
> > > > > I had a look at you link [1] and it seems that you keep a list of=
 ops as well by
> > > > > calling vm_op_enqueue() with a new struct msm_vm_op from the call=
backs.
> > > > >
> > > > > Please note that for exactly this case there is the op_alloc call=
back in
> > > > > struct drm_gpuvm_ops, such that you can allocate a custom op type=
 (i.e. struct
> > > > > msm_vm_op) that embedds a struct drm_gpuva_op.
> > > >
> > > > I did use drm_gpuvm_sm_xyz_ops_create() in an earlier iteration of =
my
> > > > VM_BIND series, but it wasn't quite what I was after.  I wanted to
> > > > apply the VM updates immediately to avoid issues with a later
> > > > map/unmap overlapping an earlier map, which
> > > > drm_gpuvm_sm_xyz_ops_create() doesn't really handle.  I'm not even
> > > > sure why this isn't a problem for other drivers unless userspace is
> > > > providing some guarantees.
> > >
> > > The drm_gpuva_ops are usually used in a pattern like this.
> > >
> > >         vm_bind {
> > >                 for_each_vm_bind_operation {
>                             drm_gpuvm_sm_xyz_ops_create();
> > >                         drm_gpuva_for_each_op {
> > >                                 // modify drm_gpuvm's interval tree
> > >                                 // pre-allocate memory
> > >                                 // lock and prepare objects
> > >                         }
> > >                 }
> > >
> > >                 drm_sched_entity_push_job();
> > >         }
> > >
> > >         run_job {
> > >                 for_each_vm_bind_operation {
> > >                         drm_gpuva_for_each_op {
> > >                                 // modify page tables
> > >                         }
> > >                 }
> > >         }
> > >
> > >         run_job {
> > >                 for_each_vm_bind_operation {
> > >                         drm_gpuva_for_each_op {
> > >                                 // free page table structures, if any
> > >                                 // free unused pre-allocated memory
> > >                         }
> > >                 }
> > >         }
> > >
> > > What did you do instead to get map/unmap overlapping? Even more inter=
esting,
> > > what are you doing now?
> >
> > From what I can tell, the drivers using drm_gpva_for_each_op()/etc are
> > doing drm_gpuva_remove() while iterating the ops list..
> > drm_gpuvm_sm_xyz_ops_create() itself does not modify the VM.  So this
> > can only really work if you perform one MAP or UNMAP at a time.  Or at
> > least if you process the VM modifying part of the ops list before
> > proceeding to the next op.
>
> (Added the drm_gpuvm_sm_xyz_ops_create() step above.)
>
> I went through the code you posted [1] and conceptually you're implementi=
ng
> exactly the pattern I described above, i.e. you do:
>
>         vm_bind {
>                 for_each_vm_bind_operation {
>                         drm_gpuvm_sm_xyz_exec_lock();
>                 }
>
>                 for_each_vm_bind_operation {
>                         drm_gpuvm_sm_xyz() {
>                                 // modify drm_gpuvm's interval tree
>                                 // create custom ops
>                         }
>                 }
>
>                 drm_sched_entity_push_job();
>         }
>
>         run_job {
>                 for_each_vm_bind_operation {
>                         for_each_custom_op() {
>                                 // do stuff
>                         }
>                 }
>         }

Close, but by the time we get to run_job there is just a single list
of ops covering all the vm_bind operations:

        run_job {
                for_each_custom_op() {
                        // do stuff
                }
        }

rather than a list of va ops per vm_bind op.

> However, GPUVM intends to solve your use-case with the following, semanti=
cally
> identical, approach.
>
>         vm_bind {
>                 for_each_vm_bind_operation {
>                         drm_gpuvm_sm_xyz_ops_create();
>
>                         drm_gpuva_for_each_op {
>                                 // modify drm_gpuvm's interval tree
>                                 // lock and prepare objects (1)

I currently decouple lock+pin from VM modification to avoid an error
path that leaves the VM partially modified.  Once you add this back
in, the va-ops approach isn't simpler, IMHO.

>                         }
>                 }
>
>                 drm_sched_entity_push_job();
>         }
>
>         run_job {
>                 for_each_vm_bind_operation {
>                         drm_gpuva_for_each_op() {
>                                 // do stuff
>                         }
>                 }
>         }
>
> (Note that GPUVM already supports to extend the existing OP structures; y=
ou
> should take advantage of that.)
>
> Hence, the helper we really want is to lock and prepare the objects at (1=
). I.e.
> a helper that takes a pointer to a struct drm_gpuva_op and locks / valida=
tes the
> corresponding objects.

I still prefer that we don't _require_ using va-ops.  But if it makes
it more useful for other drivers I could add a helper which
exec_lock's based on a list of va-ops instead.

BR,
-R

> [1] https://gitlab.freedesktop.org/robclark/msm/-/blob/sparse-newer/drive=
rs/gpu/drm/msm/msm_gem_vma.c
>
