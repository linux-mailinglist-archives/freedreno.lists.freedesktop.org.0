Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YIQFAjKrjWkK5wAAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Thu, 12 Feb 2026 11:28:02 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D21812C7A0
	for <lists+freedreno@lfdr.de>; Thu, 12 Feb 2026 11:28:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0270410E034;
	Thu, 12 Feb 2026 10:28:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="bK7JM0pS";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cPHVV0s6";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D000910E034
 for <freedreno@lists.freedesktop.org>; Thu, 12 Feb 2026 10:27:58 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61C3S5oj3145664
 for <freedreno@lists.freedesktop.org>; Thu, 12 Feb 2026 10:27:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 kst5+iQPFZYigqiEsqdKWeo2P6vTG7HS6hERc/dTS1I=; b=bK7JM0pS8G6M9Yds
 78JnS925ux/O7Ymv6CC3XB1a/A1QtzBffECbbzjoO4xdZQBr/Z9Bs0oR6XM17N4b
 d9N+1uB+CEYofVmhZpI2lf5Z2mrojaKR8ihHVoMtUOzwkcJn5ANcTGrHGRn/5IvR
 rbXFIMOobOaJoWeQQPGpqtTrSbpyqAdau6JF7Jly/kkW9urd3Ymk6bVQwAPuTTPg
 FsAaRhE8D/OEAV/IyQFABoY7AudJ95MuvrLz+P4BSD1ICaN5/cs/R45nTZXzbq+c
 /g4HrttSNBO5DftaE9ipGY/M6JWr5Pkpas0iuOesZLnRH1kaTqo5/eC59kjYPWSs
 XJZm9A==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c8ukt3fmk-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 12 Feb 2026 10:27:58 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-8954ac30d79so181488516d6.3
 for <freedreno@lists.freedesktop.org>; Thu, 12 Feb 2026 02:27:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770892077; cv=none;
 d=google.com; s=arc-20240605;
 b=QOjzNXQNIvIAz7m+ZUHNaUkg7wAMRRJPWnjYJ/gzUHNL+a24Rsjtr3vC5FxLEfoKxY
 AYNGXrmFPd93YnRb+bb2nfhuNG7w19uZga090ezxd+MIms9maoSBacyrYh9XOrEGtmx1
 XKbvGvQYusmbcGUDaR5Y3HAtdTphalJ+mFcGlzq8UVmLozXbFTvceVfz2AjCnvlTAo8b
 Ljc2S7f+8FhdOtLs0UEPuxnr2sIS3kSlX7HupiNBGss7OGnCHFdf5rrXlIH5kRdPHaFm
 BBtBwLB2Qf7sXfWABAIbNlFmK3ChJf8XjPLsWyj9QcdgZQu+juluyySaA3rM0vOGm1VS
 yakQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=kst5+iQPFZYigqiEsqdKWeo2P6vTG7HS6hERc/dTS1I=;
 fh=FMIQk7uRhFxYLBgOzC37SCM7lQeXbrpClo50baGjTw0=;
 b=Up48BVNqDB3NC1kxjTkZrC47JTE9EhFO3VWelfHVXwpHj+BCrLaSy6Iu85WAwH9nqW
 veESUgXHUcDsJ+3fQh+47zPTDM0zzH+5R6VyR2I8yBfmoH8/2yqeWP81UDADZPJ6FI+S
 33x+2c4lukW6N3E9s8igPrr6O6VAoJtF6FxKoVOXKq4pMqU/0eya/wht5sAeeAug/cdH
 R/IOySbBioseLcX+InoJ0n/oqnL7JtJYMxeYoRrBaTsppe/Nc7wH7RmKtFrZu70muSyd
 UhGFSUh/UB+8rwxcDtto8uJKntpQv7y1eiEgP+em4DFb1xfvZh/HKGKwxuN+nIy88GaX
 NbLg==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1770892077; x=1771496877;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kst5+iQPFZYigqiEsqdKWeo2P6vTG7HS6hERc/dTS1I=;
 b=cPHVV0s6i80BaIBvD5XbNpNwVy1yfDMd0EPStBeZDrdaPP5VT5/RFWxIJq8ZOwLrj4
 eesZrYSQL6yIE6WTK+ejVW3pGYnVIJfo74t6Jm+c7iBwPiH9wZMgIM0/uIF7OeL1TKev
 EIBUGub+trBC/dRzP2clZtox7bBWY6jhpG66w7Apm0ixnQ+WZ8j0AwhVY5MNQsbz1LZX
 qAu5nK8u4DzIcY7al2i0Erfp/YCRD5K1YLK4QjqU1ZXDpPT+s9tnS1zxoQqvWopMUHee
 p/t/3cpA68AVsbwylAO/jTp0wQ3VZD7elqV+SzZOR8gXTGziLCeC3nYY898sIC/haDwy
 A1Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770892077; x=1771496877;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=kst5+iQPFZYigqiEsqdKWeo2P6vTG7HS6hERc/dTS1I=;
 b=VYc3om5aV/roQTD5adSD3oKGXt+7Z5yItxyy+LYMWoDKCgy2+J47pA7ATJByOtdfkx
 x4g5KODrqfea6eIkOk0BZtl7UMoBfYdqA0Jzr2Ufdmjl0/eWRZDWO88bqH060XSuva0p
 iBbP9f1v4f3FhDaIkBpIsN1B0el6TRQK4Lp3WN7nW9d5svaODU7zcjVZZsW2GsXTem8b
 PGWx183GkT/bJ/hWcXlKfpuYYc4Yd0QcCmrleoHdcTSDvBReCNmW8D+fWfH2g7ToeIII
 ri+XVH1MJYP4p3BzsWGD3xFB55cigRLKPCTy2OFA/nJk/UkrGIoRFrp/Jqx558h57ca2
 S4kQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWd4/y9MJ7id7Wx5xbyDftrABkVBxb1nDhdLslctzkubKKCpvh4koT8GzOtjfJ6X/GLZmKWWK73bVQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzLA6gQo0FCLpTQ6ydtVuRl1o60Cmmi8pAcksfh0J5UUM9I+AHa
 9jL6r1umdhku0IUzocTubjnmqENmt2yd4fx/eiuajjKC5VJnrHNBFi3iv7EA/k08xRCLFkLi/9B
 SJZ98QjmUftAneB2SSisoFFPjRMNu9bqUZaQd8yUUjcSM5CeWDk0dD8vImBcaIUc23/3hpiOhqw
 q/cxIquKJVWRN9tU6LiAfd8EPZRo5uF5cciBOpVx5Hl7/zEA==
X-Gm-Gg: AZuq6aJU40G/vMKtcqjA7hXvukhS7qhh4d26Iva71B2rFtjEiOd+vNtP59nj7r0XdFg
 nJHyLeT+fCoN6HIywT84LW2zbKHqA2Xpd9XEpQ9v9gTPc2PCUbcjoOIKqDrKE5xxXnexR+f2ox1
 ucNath0eMdPih7wvXeMgVvl63QXW6hbH0DC7FMbz43Jmo0i/TFanpCw4H5dQoE+ql6nRkqgS9Dy
 TTRMtBV3othTZSmM8qVswrPftK4PaiPUAPt8USS
X-Received: by 2002:a05:6214:2349:b0:890:8285:e1a3 with SMTP id
 6a1803df08f44-897279cf18bmr32192826d6.63.1770892077224; 
 Thu, 12 Feb 2026 02:27:57 -0800 (PST)
X-Received: by 2002:a05:6214:2349:b0:890:8285:e1a3 with SMTP id
 6a1803df08f44-897279cf18bmr32192706d6.63.1770892076716; Thu, 12 Feb 2026
 02:27:56 -0800 (PST)
MIME-Version: 1.0
References: <20260124203925.2614008-1-quic_amakhija@quicinc.com>
 <20260124203925.2614008-2-quic_amakhija@quicinc.com>
In-Reply-To: <20260124203925.2614008-2-quic_amakhija@quicinc.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 12 Feb 2026 11:27:45 +0100
X-Gm-Features: AZwV_Qg3XNAJ5TJBNaJtsCR_H2IdzjFUFy3KhcdoQ-kiThv0UeyFl9FBwh_7Zog
Message-ID: <CAFEp6-16r0eo3z0muGWk0G2-NGa-G7PdyM92z19xKPpE46v3mg@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] arm64: dts: qcom: qcs8300: add Display Serial
 Interface device nodes
To: Ayushi Makhija <quic_amakhija@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, robdclark@gmail.com,
 dmitry.baryshkov@oss.qualcomm.com, sean@poorly.run,
 marijn.suijten@somainline.org, andersson@kernel.org, robh@kernel.org,
 robh+dt@kernel.org, krzk+dt@kernel.org, konradybcio@kernel.org,
 conor+dt@kernel.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonathan@marek.ca, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, quic_rajeevny@quicinc.com,
 quic_vproddut@quicinc.com, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEyMDA3NyBTYWx0ZWRfXy4t+v3tr9+qp
 JwGC6of6MMYkWWa7+0ZsUEuCkgWBGdIgutJJanUvCJWSnvvWrLE9yQdvPfkl1cdI5mLaNcJqVmf
 al3APTrO/tmmz9o3PaQkM8oWFSm7eBysrs6Zj6nA2kBMv/kvcOky+oSvw7nAvknDkRvd1ve7/u4
 pq9A4oHwoWBSO2UC1uc85IAVF1kvKC9PHXGb6swVsxWyOWl6AsLGaUwEKeXBhL8wKBR3jQGIP4Q
 NiWHfK7vwgZIub+80Fy53PjWP9gZZtCaXWJlLZQ3IA7gYJZ6Q3AySA7mX2CrwVtdXWX939kfuO9
 YxNrfShTGSrkDMtjXvBZUI3pZ/gDvQ3uEF+XFB0lM+HvGCGuQS1iXTJQG25xPenacwjugqsGEbs
 iXJ/FRIMpKYuTooMSl44Nfp9MuuiobXUPSHo5LvxlZn1v+XU8h23Y/debYChecRBPTez108Is3h
 cKlz8wSnCmlP0gA7RhQ==
X-Proofpoint-ORIG-GUID: mXgKg7U_xBEhp_aTmnDIKIxGJwLqtZK2
X-Authority-Analysis: v=2.4 cv=INIPywvG c=1 sm=1 tr=0 ts=698dab2e cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=h4Cvp3v_9CCKUQf7-U0A:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: mXgKg7U_xBEhp_aTmnDIKIxGJwLqtZK2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_03,2026-02-11_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 impostorscore=0 adultscore=0 priorityscore=1501 spamscore=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602120077
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:quic_amakhija@quicinc.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:robdclark@gmail.com,m:dmitry.baryshkov@oss.qualcomm.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:andersson@kernel.org,m:robh@kernel.org,m:robh+dt@kernel.org,m:krzk+dt@kernel.org,m:konradybcio@kernel.org,m:conor+dt@kernel.org,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonathan@marek.ca,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:quic_rajeevny@quicinc.com,m:quic_vproddut@quicinc.com,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[loic.poulain@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[freedreno@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,gmail.com,oss.qualcomm.com,poorly.run,somainline.org,kernel.org,intel.com,linaro.org,ideasonboard.com,marek.ca,kwiboo.se,quicinc.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	PREVIOUSLY_DELIVERED(0.00)[freedreno@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[freedreno,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,0.0.0.0:email,aec2a00:email,quicinc.com:email]
X-Rspamd-Queue-Id: 5D21812C7A0
X-Rspamd-Action: no action

Hi Ayushi,

On Sat, Jan 24, 2026 at 9:39=E2=80=AFPM Ayushi Makhija
<quic_amakhija@quicinc.com> wrote:
>
> Add device tree nodes for the DSI0 controller with their corresponding
> PHY found on Qualcomm QCS8300 SoC.
>
> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/monaco.dtsi | 105 ++++++++++++++++++++++++++-
>  1 file changed, 104 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/q=
com/monaco.dtsi
> index 5d2df4305d1c..7dda05bda3e7 100644
> --- a/arch/arm64/boot/dts/qcom/monaco.dtsi
> +++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
> @@ -3,6 +3,7 @@
>   * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserv=
ed.
>   */
>
> +#include <dt-bindings/clock/qcom,dsi-phy-28nm.h>
>  #include <dt-bindings/clock/qcom,qcs8300-gcc.h>
>  #include <dt-bindings/clock/qcom,rpmh.h>
>  #include <dt-bindings/clock/qcom,sa8775p-camcc.h>
> @@ -5573,9 +5574,19 @@ port@0 {
>                                                 reg =3D <0>;
>
>                                                 dpu_intf0_out: endpoint {
> +
>                                                         remote-endpoint =
=3D <&mdss_dp0_in>;
>                                                 };
>                                         };
> +
> +                                       port@1 {
> +                                               reg =3D <1>;
> +
> +                                               dpu_intf1_out: endpoint {
> +
> +                                                       remote-endpoint =
=3D <&mdss_dsi0_in>;
> +                                               };
> +                                       };
>                                 };
>
>                                 mdp_opp_table: opp-table {
> @@ -5603,6 +5614,96 @@ opp-650000000 {
>                                 };
>                         };
>
> +                       mdss_dsi0: dsi@ae94000 {
> +                               compatible =3D "qcom,qcs8300-dsi-ctrl",
> +                                            "qcom,sa8775p-dsi-ctrl",
> +                                            "qcom,mdss-dsi-ctrl";
> +                               reg =3D <0x0 0x0ae94000 0x0 0x400>;
> +                               reg-names =3D "dsi_ctrl";
> +
> +                               interrupt-parent =3D <&mdss>;
> +                               interrupts =3D <4>;
> +
> +                               clocks =3D <&dispcc MDSS_DISP_CC_MDSS_BYT=
E0_CLK>,
> +                                        <&dispcc MDSS_DISP_CC_MDSS_BYTE0=
_INTF_CLK>,
> +                                        <&dispcc MDSS_DISP_CC_MDSS_PCLK0=
_CLK>,
> +                                        <&dispcc MDSS_DISP_CC_MDSS_ESC0_=
CLK>,
> +                                        <&dispcc MDSS_DISP_CC_MDSS_AHB_C=
LK>,
> +                                        <&gcc GCC_DISP_HF_AXI_CLK>;
> +                               clock-names =3D "byte",
> +                                             "byte_intf",
> +                                             "pixel",
> +                                             "core",
> +                                             "iface",
> +                                             "bus";
> +
> +                               assigned-clocks =3D <&dispcc MDSS_DISP_CC=
_MDSS_BYTE0_CLK_SRC>,
> +                                                 <&dispcc MDSS_DISP_CC_M=
DSS_PCLK0_CLK_SRC>;
> +                               assigned-clock-parents =3D <&mdss_dsi0_ph=
y DSI_BYTE_PLL_CLK>,
> +                                                        <&mdss_dsi0_phy =
DSI_PIXEL_PLL_CLK>;
> +
> +                               phys =3D <&mdss_dsi0_phy>;

I'm quite sure DSI requires a refgen regulator, so add the proper
refgen-supply link.


> +
> +                               operating-points-v2 =3D <&mdss_dsi_opp_ta=
ble>;
> +                               power-domains =3D <&rpmhpd RPMHPD_MMCX>;
> +
> +                               #address-cells =3D <1>;
> +                               #size-cells =3D <0>;
> +
> +                               status =3D "disabled";
> +
> +                               ports {
> +                                       #address-cells =3D <1>;
> +                                       #size-cells =3D <0>;
> +
> +                                       port@0 {
> +                                               reg =3D <0>;
> +
> +                                               mdss_dsi0_in: endpoint {
> +
> +                                                       remote-endpoint =
=3D <&dpu_intf1_out>;
> +                                               };
> +                                       };
> +
> +                                       port@1 {
> +                                               reg =3D <1>;
> +
> +                                               mdss_dsi0_out: endpoint {
> +                                               };
> +                                       };
> +                               };
> +
> +                               mdss_dsi_opp_table: opp-table {
> +                                       compatible =3D "operating-points-=
v2";
> +
> +                                       opp-358000000 {
> +                                               opp-hz =3D /bits/ 64 <358=
000000>;
> +                                               required-opps =3D <&rpmhp=
d_opp_svs_l1>;
> +                                       };
> +                               };
> +                       };
> +
> +                       mdss_dsi0_phy: phy@ae94400 {
> +                               compatible =3D "qcom,qcs8300-dsi-phy-5nm"=
,
> +                                            "qcom,sa8775p-dsi-phy-5nm";
> +                               reg =3D <0x0 0x0ae94400 0x0 0x200>,
> +                                     <0x0 0x0ae94600 0x0 0x280>,
> +                                     <0x0 0x0ae94900 0x0 0x280>;
> +                               reg-names =3D "dsi_phy",
> +                                           "dsi_phy_lane",
> +                                           "dsi_pll";
> +
> +                               #clock-cells =3D <1>;
> +                               #phy-cells =3D <0>;
> +
> +                               clocks =3D <&dispcc MDSS_DISP_CC_MDSS_AHB=
_CLK>,
> +                                        <&rpmhcc RPMH_CXO_CLK>;
> +                               clock-names =3D "iface",
> +                                             "ref";
> +
> +                               status =3D "disabled";
> +                       };
> +
>                         mdss_dp0_phy: phy@aec2a00 {
>                                 compatible =3D "qcom,qcs8300-edp-phy", "q=
com,sa8775p-edp-phy";
>
> @@ -5730,7 +5831,9 @@ dispcc: clock-controller@af00000 {
>                                  <&mdss_dp0_phy 0>,
>                                  <&mdss_dp0_phy 1>,
>                                  <0>, <0>,
> -                                <0>, <0>, <0>, <0>;
> +                                <&mdss_dsi0_phy DSI_BYTE_PLL_CLK>,
> +                                <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>,
> +                                <0>, <0>;
>                         power-domains =3D <&rpmhpd RPMHPD_MMCX>;
>                         #clock-cells =3D <1>;
>                         #reset-cells =3D <1>;
> --
> 2.34.1
>
>
