Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D4A8B47840
	for <lists+freedreno@lfdr.de>; Sun,  7 Sep 2025 01:03:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3490710E176;
	Sat,  6 Sep 2025 23:03:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="CthncvNW";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1195810E42E
 for <freedreno@lists.freedesktop.org>; Sat,  6 Sep 2025 23:02:59 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 586M1Mgw028334
 for <freedreno@lists.freedesktop.org>; Sat, 6 Sep 2025 23:02:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:reply-to:subject:to; s=
 qcppdkim1; bh=7tSKwHt+Ek7jPABcGiy8/Q+CLwEcgRigyVjo1Zw5A58=; b=Ct
 hncvNWlMgzrXgTeBlvJleX/TQnEv0gWDzpbuHTLcAP1F5iF8ered8rp+ZJNQgp+F
 Wg8u1JXm2yYwCSiRygdMJWhVbHaOyQs6c3kq3nnKdxg4CdDx3b1uDk+tkzyjepdu
 fYTk1kvJLA59Ndsb00fb2wiVn1yGPnNzZ5tsTw+/VXoE50Sp8TSBg/ca7g/J6tcw
 HSyiYXWFfPyCCow+9xpdSEiQjeL+Gj+nyZ8YquEZf5NkQgUjNeYtU/iJ8U83ft3E
 Ptolv2skC1Bx0R2eMs/+vKQlcKTYsZiYGvG9UhcpYhuGV8c8CyBa98fxiSS/xzyp
 NntjyvLbZ6d96tmaxeUw==
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com
 [209.85.160.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490aap9hbb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sat, 06 Sep 2025 23:02:57 +0000 (GMT)
Received: by mail-oa1-f71.google.com with SMTP id
 586e51a60fabf-30cce8e3ceaso5381934fac.1
 for <freedreno@lists.freedesktop.org>; Sat, 06 Sep 2025 16:02:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757199777; x=1757804577;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7tSKwHt+Ek7jPABcGiy8/Q+CLwEcgRigyVjo1Zw5A58=;
 b=YUj9bf6BR90XX3y4J41dpir4MeBGBP3UKmizg5tKutmm6V0bUNDJrflrb5oc0JNlJE
 2J3mRJfdcKKkd03R8KAEiv79trjm5Fd4a9LOHs9lUtl1so++tkPSL7gJczByEpygvsZu
 LDTM1UfkqzWfBNefkapqxb9baEMlGeIUiezrWwLfQpE23EZTvS5RBPGaM08Xb+CRM+Ot
 PiPZ7SRllzgBH+rP3OZaHcUbOnERUA8WDlQ/RKiWwQL++SUYjNUpmttdE+WP2XoOpAaA
 gcbLYgs57BboQUvEFsRad/Z/qbUwN3vQXXpd6aocpV7N5OAOJIaewrZXdF6VRhdl2fLN
 Mj4A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXTCrDV/1KxQ25HoqdFKjOHzPkqz1MZ+RgIaXzDIVireyZD3+AKY43QYp0BACVxhnLrHC4PFZxTddM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx1IC+Xww34rfjXDtahiVqepO/MBMlol/xtuGF5S/l3tV00CXbY
 NE/WWns5MrG5PI6zEdDWXVb2FztIZe6tEC3Q0zSAvCpxg4yzLRiUFTYQtJ67dfsEv4V+0Dhw4sT
 6mT0c+riBf0U0mWCtwM/ET3QcD52r7iKVF3inDN+mbLGClM0S5Ng1R+2TI6mCj8mEfWiewBlYD9
 Me1/zKYFf5BVzDLmXZavwnoeBBa8HtsyS0U83+E2z0hJEFnw==
X-Gm-Gg: ASbGncv2Cid/M3HEyuORRWRKa1KfRNwGSHY70YqWP5koBy8i63xfmWRDJBob/D01mSz
 DSeVRoR3Og77voswljRp2Sshn8bcRl5EKCCO0NetVNmuvt/q2GSio30XcJVtjD5dl4r0qbFweOs
 6SMQWoSBNwnxdh9xAHhF8zNYLfvyrPOv/ibY8XimRDvtrifa/TWZgF
X-Received: by 2002:a05:6871:e7c3:b0:315:b768:bd1d with SMTP id
 586e51a60fabf-322627465d3mr1588927fac.6.1757199776937; 
 Sat, 06 Sep 2025 16:02:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFGNyPtWK7XLr6Z6Y8/0D04LJKsr8cN92FCpDHkSHR8k+zYD6ZV/6YLC5AI8gQTcKpJUSvoMi6UIajR6FAY6mg=
X-Received: by 2002:a05:6871:e7c3:b0:315:b768:bd1d with SMTP id
 586e51a60fabf-322627465d3mr1588917fac.6.1757199776584; Sat, 06 Sep 2025
 16:02:56 -0700 (PDT)
MIME-Version: 1.0
References: <20250822-a663-gpu-support-v4-0-97d26bb2144e@oss.qualcomm.com>
 <20250822-a663-gpu-support-v4-3-97d26bb2144e@oss.qualcomm.com>
 <f11b778d-eba1-4712-81c7-b83f2cb38b46@oss.qualcomm.com>
 <exkrgx6rdotfrrsnklsd7zk4ydehsk5vaoevibpqisyq2dwbd4@sa4kgnuexlna>
 <f169be5a-faa5-4824-861e-27bd2083b9cf@oss.qualcomm.com>
 <t5pxum74q3fwf6wgcbaeaginjvtjfn357pkfswvafsggtmvxfv@jl5qjfhpmmow>
 <c3de911c-e80a-429d-8a5c-c693546d4abf@oss.qualcomm.com>
 <14b5db9f-8b31-4baa-a03d-12112425fbbe@oss.qualcomm.com>
In-Reply-To: <14b5db9f-8b31-4baa-a03d-12112425fbbe@oss.qualcomm.com>
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Sat, 6 Sep 2025 16:02:45 -0700
X-Gm-Features: Ac12FXyzTpMUMaTsNWSW0MM7Xxq1e9X2ZKWgxsNm2xNI9hIOPJ9JgBv0CoKpoCY
Message-ID: <CACSVV02h8AUX8WtEuu5w-g2XnfBkfozHQQ15zGK6+LVX_w=d1g@mail.gmail.com>
Subject: Re: [PATCH v4 3/6] arm64: dts: qcom: sa8775p: Add gpu and gmu nodes
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Connor Abbott <cwabbott0@gmail.com>,
 Srinivas Kandagatla <srini@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Gaurav Kohli <quic_gkohli@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=eMETjGp1 c=1 sm=1 tr=0 ts=68bcbda1 cx=c_pps
 a=CWtnpBpaoqyeOyNyJ5EW7Q==:117 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8 a=M6CliHif6jTRLK_rbtEA:9
 a=QEXdDO2ut3YA:10 a=vh23qwtRXIYOdz9xvnmn:22 a=TjNXssC_j7lpFel5tvFf:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: vyfgdxtCVabvatyDBgY4XS2sB8rGHoRH
X-Proofpoint-ORIG-GUID: vyfgdxtCVabvatyDBgY4XS2sB8rGHoRH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAwMCBTYWx0ZWRfX980G8xgLbU56
 8IgUS+b9XZcnQ99L06pOdhXubKGuNjK4YBXBCzIf0Mtb1Blj/0PReJK8WXp7K4qGBRRkhuiKNED
 rJk9yRwpYTpX/UnEjAgA2F2Gxl/xTdN6QxTNOQB4hRMqDbr6TNVX1oNNdoWHaCP6bUCs+BsnKij
 mhrWkBYvAh2ysAAWKISd9uO0/OLCYjb19O+BdrutlhtWBBfwtj1EDY0k13/kdDvTuR77R2ckN6o
 NyjsqBzs5HINpD732Ru+lw5lp4zzZw/CWeUkbyFkEPbEhycapBTk4Er9XzDJziY1lcv0yxiuxXV
 DNM1tMNy6lp5oWF8m28iuQEF/9oMhVTwhx+5N3PTQy/Ng1VA2xxPe3hVmlEC2xRyML/ZOGahWBy
 dEvLlWhu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-06_08,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 adultscore=0
 bulkscore=0 phishscore=0 spamscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509060000
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

On Sat, Sep 6, 2025 at 1:56=E2=80=AFPM Akhil P Oommen <akhilpo@oss.qualcomm=
.com> wrote:
>
> On 9/3/2025 8:44 PM, Konrad Dybcio wrote:
> > On 9/3/25 4:00 PM, Dmitry Baryshkov wrote:
> >> On Wed, Sep 03, 2025 at 03:36:34PM +0200, Konrad Dybcio wrote:
> >>> On 9/3/25 2:39 PM, Dmitry Baryshkov wrote:
> >>>> On Wed, Sep 03, 2025 at 02:26:30PM +0200, Konrad Dybcio wrote:
> >>>>> On 8/21/25 8:55 PM, Akhil P Oommen wrote:
> >>>>>> From: Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
> >>>>>>
> >>>>>> Add gpu and gmu nodes for sa8775p chipset. As of now all
> >>>>>> SKUs have the same GPU fmax, so there is no requirement of
> >>>>>> speed bin support.
> >>>>>>
> >>>>>> Signed-off-by: Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
> >>>>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> >>>>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>>>>> ---
> >>>>>>  arch/arm64/boot/dts/qcom/lemans.dtsi | 116 ++++++++++++++++++++++=
+++++++++++++
> >>>>>>  1 file changed, 116 insertions(+)
> >>>>>>
> >>>>>> diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boo=
t/dts/qcom/lemans.dtsi
> >>>>>> index 8ceb59742a9fc6562b2c38731ddabe3a549f7f35..8eac8d4719db923010=
5ad93ac22287850b6b007c 100644
> >>>>>> --- a/arch/arm64/boot/dts/qcom/lemans.dtsi
> >>>>>> +++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
> >>>>>> @@ -1097,6 +1097,18 @@ ipcc: mailbox@408000 {
> >>>>>>                          #mbox-cells =3D <2>;
> >>>>>>                  };
> >>>>>>
> >>>>>> +                qfprom: efuse@784000 {
> >>>>>> +                        compatible =3D "qcom,sa8775p-qfprom", "qc=
om,qfprom";
> >>>>>> +                        reg =3D <0x0 0x00784000 0x0 0x2410>;
> >>>>>
> >>>>> len =3D 0x3000
> >>>>>
> >>>>> [...]
> >>>>>
> >>>>>> +                gmu: gmu@3d6a000 {
> >>>>>> +                        compatible =3D "qcom,adreno-gmu-663.0", "=
qcom,adreno-gmu";
> >>>>>> +                        reg =3D <0x0 0x03d6a000 0x0 0x34000>,
> >>>>>
> >>>>> This bleeds into GPU_CC, len should be 0x26000
> >>>>
> >>>> gpucc is in the middle of GMU, see other platforms.
> >>>
> >>> This is not the case here
> >>
> >> Why? I think GPU CC is a part of the GMU by design: GMU accesses GPU C=
C
> >> registers directly from the firmware.
> >
> > Correct, however this is only a similarly sounding argument - the DT
> > describes the hardware from the main Arm cluster POV. The GMU Cortex-M
> > core has its own address map etc.

but the firmware is part of how the hardware appears to the main arm cluste=
r

> We have been keeping GPUCC region in the GMU's reg range in all chipsets
> for the purpose of coredump.
>
> Can we leave this as is until we have a mechanism to dump these into gpu
> coredump (via gpucc driver??)? I recall you proposed something similar
> sometime back.

IMO we should keep this in the GMU range.. if in the future we have
some other mechanism to dump gpucc state, then for future platforms we
can start using that (ie. new dt but old kernel should be a thing we
at least pretend to try to keep working), but for current/past
platforms we should stick with keeping this in the GMU's range

BR,
-R

> -Akhil
>
> >
> > Konrad
>
